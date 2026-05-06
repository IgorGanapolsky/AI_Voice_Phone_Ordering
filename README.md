# AI Voice Phone Ordering Launch Kit

This repo is a ready-to-demo package for selling an AI phone ordering and reservation agent to restaurants.

Built assets:

- Local browser demo: `demo/index.html`
- n8n importable demo workflow: `n8n/restaurant-voice-agent.workflow.json`
- Sample QSR menu data: `data/menu.csv`
- Order logging template: `data/orders_sample.csv`
- Call log template: `data/call_log_sample.csv`
- Reservation log template: `data/reservations_sample.csv`
- Sales offer, demo script, setup checklist, prospect sources, and outreach copy: `sales/`
- Live Stripe checkout details: `sales/stripe_checkout.md`
- Same-day operator packet: `reports/gtm/2026-05-06-money-today/operator-close-packet.md`

## Fast Demo

Open this file in a browser:

```text
demo/index.html
```

Use the scenario buttons or type caller phrases like:

```text
I want two turkey footlong meals for pickup
Can I book a table for four tonight at 7?
Are you still taking orders?
```

The demo responds with voice-call style transcript handling, menu-aware ordering, reservation capture, missed-call recovery, upsell prompts, and staff-ready summaries.

## n8n Demo Import

Import this workflow into n8n:

```text
n8n/restaurant-voice-agent.workflow.json
```

It creates a POST webhook that accepts Vapi/Retell-style call payloads or plain JSON:

```json
{
  "transcript": "I want two turkey footlong meals for pickup",
  "from": "+13055550123",
  "call_id": "demo-call-001"
}
```

The workflow returns structured JSON with:

- Caller-facing response
- Call intent
- Matched menu items or reservation details
- Suggested upsell
- Estimated subtotal
- Staff handoff summary

This import path is intentionally credential-light so it can be demoed before Vapi, Retell, Twilio, Google Sheets, OpenAI, or POS credentials are connected.

## Production Upgrade Path

Use the no-credential demo to close interest, then upgrade the client workflow with:

- Retell AI or Vapi for live phone answering
- Twilio or provider-managed phone number transfer
- OpenAI or Claude for natural language handling
- Google Sheets, Airtable, or POS API for order/reservation logging
- SMS, email, Slack, printer, or POS note for staff handoff
- Human fallback for low-confidence calls, payment questions, complaints, and allergy-sensitive decisions

## What Is Ready

This package is ready for:

- A 60-second Loom demo
- A live in-person demo from the local HTML file
- Importing into n8n for webhook testing
- Manual outbound prospecting to Miami restaurants and QSR operators
- Closing a paid setup sprint before production telephony is configured

Outreach is active. As of 2026-05-06, 27 first-touch emails are confirmed from this repo. Track buyer truth in:

```text
sales/lead_tracker.csv
sales/outreach_state.md
reports/gtm/2026-05-06-money-today/operator-close-packet.md
```

## Offer

The default first offer is a $2,997 AI Phone Ordering Setup Sprint with optional $297/month monitoring and menu updates.

Setup checkout:

```text
https://buy.stripe.com/cNi7sLbmIe1E9G135V3sI0F
```
