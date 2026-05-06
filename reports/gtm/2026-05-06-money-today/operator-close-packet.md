# Operator Close Packet

Date: 2026-05-06

## Offer

AI Voice Phone Ordering + Reservation Agent.

Default close:

```text
$2,997 setup sprint + optional $297/month monitoring
```

Setup checkout:

```text
https://buy.stripe.com/cNi7sLbmIe1E9G135V3sI0F
```

Audit checkout:

```text
https://buy.stripe.com/eVq8wPaiEcXAf0l5e33sI17
```

Diagnostic checkout:

```text
https://buy.stripe.com/8x2dR94Yk3n06tP7mb3sI0Q
```

Monthly monitoring checkout:

```text
https://buy.stripe.com/00w8wP2QccXA3hD8qf3sI0G
```

## Buyer

Miami restaurant, cafe, QSR, sandwich shop, bakery, or caterer that depends on phone calls for pickup orders, reservations, catering leads, or hours/menu questions.

## Demo

Open:

```text
demo/index.html
```

Show:

- Pickup order capture
- Reservation capture
- Missed-call recovery
- Upsell prompt
- Staff handoff ticket

## 10-Minute Demo Flow

1. Ask how many calls they miss during rush or after hours.
2. Ask what staff currently do when two calls arrive at once.
3. Show `Pickup Order`.
4. Show `Reservation`.
5. Show staff handoff.
6. Explain production path: voice provider, phone number, menu, logs, staff notifications.
7. Close on setup sprint.

## Close Script

```text
I can set this up for your menu and call flow in one afternoon. The setup sprint is $2,997. We start with your menu, phone script, and handoff destination, then I deliver a live demo before we point real calls at it. If the demo does not match your restaurant flow by the end of setup day, you do not pay the final 50%.
```

## Current Truth

- Stripe checkout links are live.
- $99 audit checkout is live and should be the lower-friction same-day CTA.
- $499 diagnostic checkout is live as the next step after the audit.
- First Mail batch sent to 12 prospects.
- Second demo-link batch sent to 9 prospects after Mail relaunch.
- Third demo-link batch sent to 6 prospects.
- Fourth $499 diagnostic batch sent to 10 prospects and confirmed in Gmail All Mail.
- Replacement $499 diagnostic chunk sent to 4 prospects and confirmed in Gmail All Mail.
- Fresh $499 diagnostic chunk sent to 4 prospects and confirmed in Gmail All Mail.
- Mobile vendor $499 diagnostic chunk sent to 4 prospects and confirmed in Gmail All Mail.
- Drafted prospect $499 diagnostic chunk sent to 4 prospects and confirmed in Gmail All Mail.
- Remaining drafted prospect $499 diagnostic + audio proof chunk sent to 5 prospects and confirmed in Mail sent box.
- Fresh web-sourced $499 diagnostic + audio proof chunk sent to 12 prospects and confirmed in Mail sent box.
- Soft phone-order audit reply CTA sent to 7 additional published-email prospects and recorded in `sales/sent_lock.csv`.
- Sourced 8 additional draft-only phone-first prospects (NYC/LA/Fort Lauderdale) with published email+phone; not contacted yet.
- `sales/lead_tracker.csv` truth: 104 total leads = 72 `contacted`, 26 `draft`, 1 `queued`, 4 `bounced`, 1 `lost` (active non-bounced pipeline = 99).
- $99 audit follow-up sent to 8 warm prospects and confirmed in Gmail All Mail.
- Confirmed delivery failures: 4.
- Confirmed lost replies: 1.
- Remaining draft-only leads: 26 (19 with published email; 7 phone-only/contact-form leads).
- Rice Mediterranean Kitchen is queued in Mail Outbox only; do not mark contacted until Gmail All Mail confirms send.
- Public demo is live: `https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/`
- Public landing now shows the $99 audit checkout as the lowest-friction CTA.
- Zernio organic dispatch completed successfully:
  - Run `25452766248`: LinkedIn/Threads offer dispatch reported `published=3`, `errors=0`; Bluesky was blocked by length in that run.
  - Run `25452975637`: Bluesky short variant reported `published=1`, `errors=0`.
- 2026-05-06 14:52 ET diagnostic social dispatch: Threads and Bluesky published; LinkedIn failed in Zernio with `auth_expired` / `invalid_grant`.
  - Threads: `https://www.threads.com/@igorganapolsky/post/DYAgerbiDYL`
  - Bluesky: `https://bsky.app/profile/iganapolsky.bsky.social/post/3ml7eorsxua2c`
- 2026-05-06 15:37 ET $99 audit Bluesky short dispatch completed on GitHub Actions run `25456470663`; logs report `published=1`, `errors=0`.
- Emergency direct-checkout ThumbGate paid sprint pivot published through the working Zernio rail:
  - Threads run `25459226488`: `published=1`, `errors=0`, post id `69fba47e951b178c1e789058`.
  - Bluesky run `25459488138`: `published=1`, `errors=0`, post id `69fba5c21611a8798e2fea76`.
- Stripe live balance remains `$0` available and `$0` pending as of 2026-05-06 16:35 ET; May 6 charge search returned no charges as of 2026-05-06 16:35 ET.
- Inbox scan after the $99 follow-up found one lost reply from Seasons Catering: `Not interested at this time`. No immediate delivery failures matched those 8 follow-up addresses.
- Exquisite Catering Boxtrapper verification passed at 2026-05-06 15:39 ET; this is not a buyer reply, so it remains in monitor state.
- Zernio budget is capped at `$5/month`; organic publishing only. The provided local key returned `401 Unauthorized`, so rotate it before reuse.
- Use `sales/lead_tracker.csv` for next buyer actions.
