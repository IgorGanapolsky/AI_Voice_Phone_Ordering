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

## Second Batch

After restarting Mail cleanly, the second demo-link batch was sent and confirmed in Gmail All Mail:

```text
https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/
```

Recipients:

- Mami's 305: info@mamis305.com
- Kai Tsu Restaurant: kaitsurestaurant@gmail.com
- COD Seafood: eat@codseafood.com
- Catering by Lovables: info@cateringbylovables.com
- The Golden Hog: info@thegoldenhogmarket.com
- Ghee Indian Kitchen: info@gheemiami.com
- Tu Sushi 305: tusushi305@gmail.com
- Joanna's Marketplace: CATERING@JOANNASMARKETPLACE.COM
- Lemon Garden Organic Cafe: catering@miamiironside.com

## Third Batch

Fresh public-source batch sent and confirmed in Gmail All Mail:

- Lovables Catering + Kitchen: info@lovablescatering.com
- City Chef Catering: info@citychefcatering.com
- Blue Collar Miami: info@bcrmiami.com
- Whisk Gourmet: info@whiskgourmet.com
- VNV Events: info@vnvevents.com
- Grand Oasis: eni305@icloud.com

## Fourth Batch

Fresh public-source $499 diagnostic batch sent and confirmed in Gmail All Mail:

- El Pimiento Express: catering@elpimientorestaurant.com
- Edan Bistro: info@edanbistro.com
- Jacky's Cafe: jackyscafe@hotmail.com
- El Machetico: info@elmacheticorestaurant.com
- Bellacapri Restaurant: Bellacaprirestaurant@gmail.com
- Sand'which Miami: contact@sandwhichmiami.com
- Rosaluna Ristorante: info@rosalunaristorante.com
- Cook'N Catering: Cooknfresh@gmail.com
- House of Wings: Frantz@houseofwingsmiami.com
- Chef Paella: chefpaellaeventcatering@gmail.com

No new bounces were found in the immediate post-send scan; the scan only returned the two previously known delivery failures.

## Running Total

Confirmed voice-agent first touches from this repo:

```text
37
```

Confirmed delivery failures from this repo:

```text
2
```

Bounced addresses:

- info@cateringbylovables.com: 550 No Such User Here
- info@whiskgourmet.com: account does not exist

Active non-bounced first-touch pipeline:

```text
35
```
