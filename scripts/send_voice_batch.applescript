set prospects to {¬
  {restaurantName:"Galaxy Bakery", recipientEmail:"info@galaxybakerymiami.com", angle:"bakery phone orders and special-order calls"}, ¬
  {restaurantName:"European Corner", recipientEmail:"europeancorner@aol.com", angle:"bakery rush-hour calls and pickup questions"}, ¬
  {restaurantName:"Sapore di Mare", recipientEmail:"saporedimaremiami@gmail.com", angle:"reservation calls and phone ordering"}, ¬
  {restaurantName:"Mega Bakery", recipientEmail:"megabakerymiami@gmail.com", angle:"bakery phone orders and customer questions"}, ¬
  {restaurantName:"Sergio's Catering", recipientEmail:"info@sergioscafeteria.com", angle:"catering inquiry calls and follow-up"}, ¬
  {restaurantName:"Paella 305", recipientEmail:"anthony@paella305.com", angle:"catering lead calls and event quote requests"}, ¬
  {restaurantName:"Sesame Bakery", recipientEmail:"catering@sesamebakery.com", angle:"catering calls and advance-order questions"}, ¬
  {restaurantName:"PINCHO Catering", recipientEmail:"catering@pincho.com", angle:"catering calls and multi-location routing"}, ¬
  {restaurantName:"A Joy Catering", recipientEmail:"isabelf@ajoycatering.com", angle:"event inquiry calls and catering qualification"}, ¬
  {restaurantName:"Bill Hansen Catering", recipientEmail:"sandra@billhansencatering.com", angle:"event inquiry calls and catering qualification"}, ¬
  {restaurantName:"Creative Edge Parties", recipientEmail:"Manuel@Creativeedgeparties.com", angle:"event inquiry calls and catering qualification"}, ¬
  {restaurantName:"Events by Executive Caterers", recipientEmail:"catering@eventsbyexecutivecaterers.com", angle:"catering order calls and staff handoff"} ¬
}

set setupLink to "https://buy.stripe.com/cNi7sLbmIe1E9G135V3sI0F"

tell application "Mail"
  repeat with prospect in prospects
    set restaurantName to restaurantName of prospect
    set recipientEmail to recipientEmail of prospect
    set angle to angle of prospect
    set subjectLine to "AI phone agent demo for " & restaurantName
    set bodyText to "Hey " & restaurantName & " team," & return & return & "I used to lead mobile app work for Subway, and I built a quick AI phone agent for restaurants and catering operators." & return & return & "For " & restaurantName & ", the useful angle looks like " & angle & ": the agent can answer when staff are busy, capture the order/reservation/catering request, ask the needed confirmation questions, suggest simple add-ons, and send staff a clean handoff." & return & return & "I have a working 60-second demo and can configure it around your menu and call flow in one afternoon. Setup is $2,997. If this is already a priority, the setup sprint link is here:" & return & setupLink & return & return & "Open to a 10-minute look this week?" & return & return & "Best," & return & "Igor" & return & "Former Subway Mobile App Lead"
    set outgoingMessage to make new outgoing message with properties {subject:subjectLine, content:bodyText, visible:false}
    tell outgoingMessage
      make new to recipient at end of to recipients with properties {address:recipientEmail}
      send
    end tell
    delay 2
  end repeat
end tell

return "sent " & (count of prospects) & " messages"
