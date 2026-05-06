# Client Setup Checklist

## Before Demo

- Restaurant name
- Public menu URL, PDF, Toast/Square page, or spreadsheet
- Main phone number and current call handling process
- Peak missed-call windows
- Whether the agent should handle orders, reservations, catering leads, hours, or all of them
- Staff handoff preference: SMS, email, Slack, Google Sheet, printer, POS note, or manager call
- Top 5 upsells: combo, dessert, drink, premium protein, catering tray
- Human fallback rule: transfer live, take message, or send staff alert

## Required For Production

- Retell AI, Vapi, or equivalent voice-agent workspace
- Phone number path: new number, forwarded number, or Twilio/provider number
- OpenAI or Claude API key if not included in the voice provider
- Google Sheets, Airtable, Supabase, or POS access for logs
- Staff notification destination
- Approved call script, response tone, and escalation rules
- Written approval for recording, transcription, and customer disclosure language where required

## Google Sheet Columns

Calls sheet:

```text
timestamp,call_id,caller_phone,intent,call_status,duration_seconds,confidence,staff_handoff,notes
```

Orders sheet:

```text
timestamp,call_id,customer_name,customer_phone,items,subtotal,upsell_offered,upsell_accepted,pickup_time,status,notes
```

Reservations sheet:

```text
timestamp,call_id,customer_name,customer_phone,party_size,requested_time,status,notes
```

## Escalation Rules

Escalate to human staff when:

- Customer asks for refunds, complaints, allergens, manager, or legal/medical-sensitive topics
- Payment details must be collected or changed
- Delivery address cannot be verified
- Item availability is uncertain
- Caller is angry or repeats unclear information twice
- Order value exceeds the configured threshold
- Caller requests catering, private event, or same-day large order beyond store rules
