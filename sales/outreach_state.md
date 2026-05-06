# Outreach State

Status: clean repo state.

No outreach has been sent from this `AI_Voice_Phone_Ordering` project yet.

Correction after first send block:

- 2026-05-06 14:12 ET: first Mail batch returned `sent 12 messages`; those 12 are marked `contacted`.
- 2026-05-06 14:40 ET: second demo-link batch timed out in Apple Mail and is not confirmed in the Mail index; those leads remain `queued`.
- Apple Mail automation is currently unreliable until the Mail app or macOS automation permission issue is cleared.
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
