# Mail Sent Reconciliation

Date: 2026-05-06

## Batch

Apple Mail returned:

```text
sent 12 messages
```

## Offer

AI Voice Phone Ordering Setup Sprint.

Checkout:

```text
https://buy.stripe.com/cNi7sLbmIe1E9G135V3sI0F
```

## Recipients

- Galaxy Bakery: info@galaxybakerymiami.com
- European Corner: europeancorner@aol.com
- Sapore di Mare: saporedimaremiami@gmail.com
- Mega Bakery: megabakerymiami@gmail.com
- Sergio's Catering: info@sergioscafeteria.com
- Paella 305: anthony@paella305.com
- Sesame Bakery: catering@sesamebakery.com
- PINCHO Catering: catering@pincho.com
- A Joy Catering: isabelf@ajoycatering.com
- Bill Hansen Catering: sandra@billhansencatering.com
- Creative Edge Parties: Manuel@Creativeedgeparties.com
- Events by Executive Caterers: catering@eventsbyexecutivecaterers.com

## Source Of Truth

- `sales/lead_tracker.csv` marks these as `contacted`.
- `sales/sent_lock.csv` prevents duplicate first touches.
- Do not send another cold email to these addresses today unless they reply.

## Second Batch Attempt

Attempted a second demo-link batch after GitHub Pages went live:

```text
https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/
```

Apple Mail timed out before returning success, and the local Mail index did not show those subjects as sent. Those second-batch leads remain `queued` in `sales/lead_tracker.csv` and must not be treated as contacted.
