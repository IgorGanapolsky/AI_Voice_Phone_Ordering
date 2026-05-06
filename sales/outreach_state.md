# Outreach State

Status: active outreach in progress.

Confirmed outreach from this `AI_Voice_Phone_Ordering` project:

- 2026-05-06 14:12 ET: first Mail batch returned `sent 12 messages`; those 12 are marked `contacted`.
- 2026-05-06 13:55-13:56 ET: second demo-link batch sent after Mail relaunch; 9 marked `contacted`.
- 2026-05-06 14:01 ET: third demo-link batch sent; 6 marked `contacted`.
- 2026-05-06 14:06 ET: fourth $499 diagnostic batch sent and confirmed in Gmail All Mail; 10 marked `contacted`.
- 2026-05-06 14:25 ET: replacement $499 diagnostic chunk sent and confirmed in Gmail All Mail; 4 marked `contacted`.
- 2026-05-06 14:30 ET: fresh $499 diagnostic chunk sent and confirmed in Gmail All Mail; 4 marked `contacted`.
- 2026-05-06 14:32 ET: mobile vendor $499 diagnostic chunk sent and confirmed in Gmail All Mail; 4 marked `contacted`.
- 2026-05-06 14:37 ET: drafted prospect $499 diagnostic chunk sent and confirmed in Gmail All Mail; 4 moved from `draft` to `contacted`.
- 2026-05-06 14:15 ET: Zernio organic offer dispatch completed on GitHub Actions run `25452766248`; logs report `published=3`, `errors=0`.
- 2026-05-06 14:17 ET: Zernio Bluesky short variant completed on GitHub Actions run `25452975637`; logs report `published=1`, `errors=0`.
- 2026-05-06 14:16 ET: GitHub Pages build completed for commit `5c66091`; public landing includes the $499 diagnostic CTA.
- 2026-05-06 14:31 ET: sourced 9 additional high-fit prospects with published phone + email (status `draft`; not contacted).
- 2026-05-06 15:17 ET: verified Stripe live balance `$0` available / `$0` pending; searched May 6 succeeded charges and found none.
- 2026-05-06 15:18 ET: sourced 8 additional high-fit prospects with published phone + email (status `draft`; not contacted).
- 2026-05-06 15:24 ET: created live $99 AI Phone 24-Hour Call Leak Audit checkout and sent 8 warm follow-ups; Gmail All Mail confirmed all 8; no immediate matching bounces.
- 2026-05-06 15:32 ET: Seasons Catering replied `Not interested at this time`; marked `lost` and removed from follow-up.
- 2026-05-06 15:35 ET: soft phone-order audit reply CTA sent to 7 additional published-email prospects; marked `contacted` and locked in `sales/sent_lock.csv`.
- 2026-05-06 15:37 ET: Zernio $99 audit Bluesky short dispatch completed on GitHub Actions run `25456470663`; logs report `published=1`, `errors=0`.
- 2026-05-06 15:39 ET: Exquisite Catering Boxtrapper verification passed; not a buyer reply, keep as `contacted` and monitor.
- 2026-05-06 15:44 ET: verified public GitHub Pages landing includes the $99 audit checkout CTA.
- 2026-05-06 15:45 ET: verified Stripe live balance `$0` available / `$0` pending; May 6 live charge search returned none.
- 2026-05-06 15:45 ET: sourced 7 additional high-fit phone-first prospects (5 with published email+phone; 2 phone-only contact-form leads) and kept them `draft`.
- 2026-05-06 16:16 ET: verified Stripe live balance `$0` available / `$0` pending; May 6 live charge search returned none.
- 2026-05-06 16:16 ET: sourced 8 additional high-fit phone-first prospects with published email+phone (NYC/LA/Fort Lauderdale) and kept them `draft`.
- 2026-05-06 15:48 ET: ported the guarded one-at-a-time Mail sender pattern from `../Restaurant`; dry-run checked 3 eligible draft emails.
- 2026-05-06 15:48 ET: queued one Rice Mediterranean Kitchen message through Mail automation; Gmail All Mail has not confirmed it, so the lead is `queued`, not `contacted`, and it is not in `sent_lock.csv`.
- 2026-05-06 16:28 ET: emergency ThumbGate paid sprint pivot published to Threads via Zernio run `25459226488`; logs report `published=1`, `errors=0`, post id `69fba47e951b178c1e789058`.
- 2026-05-06 16:34 ET: direct-checkout ThumbGate paid sprint pivot published to Bluesky via Zernio run `25459488138`; logs report `published=1`, `errors=0`, post id `69fba5c21611a8798e2fea76`.
- 2026-05-06 16:35 ET: verified Stripe live balance `$0` available / `$0` pending; May 6 live charge search returned none after the Zernio posts.
- Confirmed voice-agent first touches from this repo: 77.
- Confirmed bounces: 4 (`info@cateringbylovables.com`, `info@whiskgourmet.com`, `catering@elpimientorestaurant.com`, `chefpaellaeventcatering@gmail.com`).
- Confirmed lost replies: 1 (`seasonscatering40@aol.com`).
- Active non-bounced pipeline (draft+queued+contacted+replied+demo_booked+won): 99.
- Verified follow-ups from this repo: 8.
- Zernio budget is capped at `$5/month`; use organic posting only. No paid boosts, ads, or plan changes.
- The provided local Zernio key returned `401 Unauthorized`; rotate it before reuse.

Use `sales/lead_tracker.csv` as the source of truth before sending anything:

- `draft`: researched but not contacted
- `queued`: approved for next send batch
- `contacted`: actually sent through a real channel
- `replied`: buyer replied
- `demo_booked`: demo scheduled
- `won`: paid setup closed
- `lost`: explicitly not interested

Do not mark a lead `contacted` for drafts, copied messages, opened browser pages, or unsent emails.
