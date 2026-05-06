#!/usr/bin/env ruby
# frozen_string_literal: true

require "csv"
require "fileutils"
require "open3"
require "set"
require "time"

ROOT = File.expand_path("..", __dir__)
LEADS_PATH = File.join(ROOT, "sales", "lead_tracker.csv")
SENT_LOCK_PATH = File.join(ROOT, "sales", "sent_lock.csv")
LOG_DIR = File.join(ROOT, "reports", "gtm", "2026-05-06-money-today")
MAILING_ADDRESS = "11909 Glenmore Dr, Coral Springs, FL 33071"
PHONE = "201 639 1534"
DEMO_URL = "https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/"
AUDIT_URL = "https://buy.stripe.com/eVq8wPaiEcXAf0l5e33sI17"
LIMIT = Integer(ENV.fetch("LIMIT", "1"))
DRY_RUN = ENV["CONFIRM_SEND"] != "YES"

def read_csv(path)
  content = File.binread(path).force_encoding("UTF-8").encode("UTF-8", invalid: :replace, undef: :replace)
  CSV.parse(content, headers: true)
end

def write_rows(path, rows)
  CSV.open(path, "w", write_headers: true, headers: rows.headers) do |csv|
    rows.each { |row| csv << row }
  end
end

def applescript_string(value)
  value.to_s.gsub("\\", "\\\\\\").gsub('"', '\\"')
end

def applescript_multiline(value)
  value.to_s.split("\n", -1).map { |line| "\"#{applescript_string(line)}\"" }.join(" & return & ")
end

def source_signal(row)
  notes = row["notes"].to_s.downcase
  url = row["url"].to_s.downcase
  return "I saw your public catering contact details." if notes.include?("catering") || url.include?("catering")
  return "I saw your public restaurant contact page." if url.include?("contact")
  return "I saw your public bakery contact details." if row["restaurant_name"].to_s.downcase.include?("bakery")

  "I saw your public business contact details."
end

def body_for(row)
  name = row["restaurant_name"].to_s
  [
    "Hey #{name} team,",
    "",
    source_signal(row),
    "",
    "I led mobile app work for Subway and am testing a same-day AI phone audit for restaurants/caterers: missed calls, order questions, add-ons, and staff handoff.",
    "",
    "Want a 3-point phone-flow teardown for #{name}? Reply yes. Paid same-day option: #{AUDIT_URL}",
    "",
    "Demo page: #{DEMO_URL}",
    "",
    "Best,",
    "Igor Ganapolsky",
    "Former Subway Mobile App Team Lead | AI Automation for Restaurants",
    PHONE,
    "",
    "--",
    "Ad/solicitation disclosure: I am reaching out about a paid restaurant automation service.",
    "Opt out: reply \"no\" and I will not contact you again.",
    "Mailing address: #{MAILING_ADDRESS}"
  ].join("\n")
end

def script_for(row)
  <<~APPLESCRIPT
    on run argv
      set restaurantName to "#{applescript_string(row["restaurant_name"])}"
      set emailAddress to "#{applescript_string(row["email"])}"
      set subjectLine to "Quick phone-flow idea for " & restaurantName
      set bodyText to #{applescript_multiline(body_for(row))}
      with timeout of 300 seconds
        tell application "Mail"
          set newMessage to make new outgoing message with properties {subject:subjectLine, content:bodyText, visible:false}
          tell newMessage
            make new to recipient at end of to recipients with properties {address:emailAddress}
            send
          end tell
        end tell
      end timeout
      return restaurantName & "," & emailAddress
    end run
  APPLESCRIPT
end

def update_lock(sent_emails, timestamp)
  rows = File.exist?(SENT_LOCK_PATH) ? read_csv(SENT_LOCK_PATH) : CSV::Table.new([])
  headers = rows.headers || %w[email first_seen sent_count duplicate]
  existing = rows.map { |row| row["email"].to_s.downcase }.to_set

  sent_emails.each do |email|
    normalized = email.to_s.downcase
    next if existing.include?(normalized)

    rows << CSV::Row.new(headers, [normalized, timestamp, 1, false])
    existing << normalized
  end

  CSV.open(SENT_LOCK_PATH, "w", write_headers: true, headers: headers) do |csv|
    rows.each { |row| csv << row }
  end
end

FileUtils.mkdir_p(LOG_DIR)
rows = read_csv(LEADS_PATH)
lock = File.exist?(SENT_LOCK_PATH) ? read_csv(SENT_LOCK_PATH).map { |row| row["email"].to_s.downcase }.to_set : Set.new
eligible = rows.select do |row|
  row["status"] == "draft" &&
    row["email"].to_s.include?("@") &&
    !lock.include?(row["email"].to_s.downcase)
end.first(LIMIT)

timestamp = Time.now.iso8601
safe_stamp = timestamp.gsub(/[:+]/, "-")
log_path = File.join(LOG_DIR, "sent-batch-#{safe_stamp}.csv")
sent_lines = []
errors = []

unless DRY_RUN
  eligible.each_with_index do |row, index|
    script_path = File.join(LOG_DIR, "mail-batch-#{safe_stamp}-#{index + 1}.applescript")
    File.write(script_path, script_for(row))
    stdout, stderr, status = Open3.capture3("osascript", script_path)
  status.success? ? sent_lines << stdout.strip : errors << "#{row["email"]}: #{stderr} #{stdout}".strip
    sleep 2
  end
end

queued_emails = DRY_RUN ? [] : sent_lines.map { |line| line.split(",", 2).last }.compact
unless DRY_RUN
  rows.each do |row|
    next unless queued_emails.include?(row["email"])

    row["status"] = "queued"
    row["channel"] = "Mail app Gmail"
    row["last_touch"] = timestamp
    row["next_step"] = "Confirm Gmail All Mail before marking contacted"
    row["notes"] = [row["notes"], "$99 phone-flow reply CTA queued in Mail Outbox"].reject(&:empty?).join(" | ")
  end
  write_rows(LEADS_PATH, rows)
end

CSV.open(log_path, "w", write_headers: true, headers: %w[restaurant_name email status timestamp dry_run error]) do |csv|
  eligible.each do |row|
    status = queued_emails.include?(row["email"]) ? "queued_outbox" : (DRY_RUN ? "dry_run" : "unknown")
    csv << [row["restaurant_name"], row["email"], status, timestamp, DRY_RUN, errors.find { |error| error.start_with?(row["email"].to_s) }]
  end
end

puts "#{DRY_RUN ? "would send" : "sent"} #{DRY_RUN ? eligible.length : sent_emails.length} emails"
puts log_path
