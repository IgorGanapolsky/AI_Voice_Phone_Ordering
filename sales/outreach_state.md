# Outreach State

Status: active outreach in progress.

Confirmed outreach from this `AI_Voice_Phone_Ordering` project:

- 2026-05-06 14:12 ET: first Mail batch returned `sent 12 messages`; those 12 are marked `contacted`.
- 2026-05-06 13:55-13:56 ET: second demo-link batch sent after Mail relaunch; 9 marked `contacted`.
- 2026-05-06 14:01 ET: third demo-link batch sent; 6 marked `contacted`.
- 2026-05-06 14:06 ET: fourth $499 diagnostic batch sent and confirmed in Gmail All Mail; 10 marked `contacted`.
- 2026-05-06 14:25 ET: replacement $499 diagnostic chunk sent and confirmed in Gmail All Mail; 4 marked `contacted`.
- 2026-05-06 14:15 ET: Zernio organic offer dispatch completed on GitHub Actions run `25452766248`; logs report `published=3`, `errors=0`.
- 2026-05-06 14:17 ET: Zernio Bluesky short variant completed on GitHub Actions run `25452975637`; logs report `published=1`, `errors=0`.
- 2026-05-06 14:16 ET: GitHub Pages build completed for commit `5c66091`; public landing includes the $499 diagnostic CTA.
- Confirmed voice-agent first touches from this repo: 41.
- Confirmed bounces: 4 (`info@cateringbylovables.com`, `info@whiskgourmet.com`, `catering@elpimientorestaurant.com`, `chefpaellaeventcatering@gmail.com`).
- Active non-bounced first-touch pipeline: 37.
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
