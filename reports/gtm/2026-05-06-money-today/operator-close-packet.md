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
- $499 diagnostic checkout is live and should be the lower-friction same-day CTA.
- First Mail batch sent to 12 prospects.
- Second demo-link batch sent to 9 prospects after Mail relaunch.
- Third demo-link batch sent to 6 prospects.
- Confirmed voice-agent first touches from this repo: 27.
- Confirmed delivery failures: 2.
- Active non-bounced first-touch pipeline: 25.
- Public demo is live: `https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/`
- Stripe live balance remains `$0` available and `$0` pending as of the latest check.
- Zernio budget is capped at `$5/month`; organic publishing only. The provided local key returned `401 Unauthorized`, so rotate it before reuse.
- Use `sales/lead_tracker.csv` for next buyer actions.
