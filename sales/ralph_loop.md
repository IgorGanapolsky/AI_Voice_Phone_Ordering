# Ralph Loop

Status: operating loop defined. Not a claim that a background process is currently running.

## Objective

Run this loop every working block until the first paid checkout lands.

## Budget Guardrail

Zernio budget cap: `$5/month`.

- Organic posts only.
- No paid boosts.
- No ads.
- No plan upgrades.
- No API retries that risk paid usage without a valid key and clear purpose.

## Loop

1. Check Stripe balance and today's charge activity.
2. Check Mail replies from contacted leads.
3. Move only real sent messages to `contacted`.
4. Keep timed-out Mail attempts as `queued` or `draft`.
5. Add 5-10 fresh phone-first restaurant/catering prospects.
6. Send through a working channel only.
7. If a buyer replies positively, send the public demo and two specific demo times.
8. If a buyer asks how to proceed, send the setup checkout link.

## Current Hard Truth

Stripe is still `$0` available and `$0` pending after the first same-day push.

## Working Links

Public demo:

```text
https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/
```

Setup checkout:

```text
https://buy.stripe.com/cNi7sLbmIe1E9G135V3sI0F
```

## Blockers

- Apple Mail automation timed out after the first batch.
- Computer Use returned macOS AppleEvent permission errors.
- The provided Zernio key returned `401 Unauthorized`; rotate before reuse.
- ThumbGate protected branch blocked adding an immediate custom Zernio workflow to reuse the existing secret.
