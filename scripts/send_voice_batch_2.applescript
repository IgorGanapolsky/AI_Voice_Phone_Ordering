set prospects to {¬
  {restaurantName:"Mami's 305", recipientEmail:"info@mamis305.com", angle:"corporate and private event catering calls"}, ¬
  {restaurantName:"Kai Tsu Restaurant", recipientEmail:"kaitsurestaurant@gmail.com", angle:"reservation, delivery, and catering questions"}, ¬
  {restaurantName:"COD Seafood", recipientEmail:"eat@codseafood.com", angle:"custom order and catering request calls"}, ¬
  {restaurantName:"Catering by Lovables", recipientEmail:"info@cateringbylovables.com", angle:"catering inquiry calls and staff handoff"}, ¬
  {restaurantName:"The Golden Hog", recipientEmail:"info@thegoldenhogmarket.com", angle:"market catering orders and customer questions"}, ¬
  {restaurantName:"Ghee Indian Kitchen", recipientEmail:"info@gheemiami.com", angle:"catering and buyout inquiry calls"}, ¬
  {restaurantName:"Tu Sushi 305", recipientEmail:"tusushi305@gmail.com", angle:"delivery, catering, and custom sushi order calls"}, ¬
  {restaurantName:"Joanna's Marketplace", recipientEmail:"CATERING@JOANNASMARKETPLACE.COM", angle:"catering order calls and quote handoff"}, ¬
  {restaurantName:"Lemon Garden Organic Cafe", recipientEmail:"catering@miamiironside.com", angle:"catering, reservations, and special-order calls"} ¬
}

set demoLink to "https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/"
set setupLink to "https://buy.stripe.com/cNi7sLbmIe1E9G135V3sI0F"

tell application "Mail"
  repeat with prospect in prospects
    set restaurantName to restaurantName of prospect
    set recipientEmail to recipientEmail of prospect
    set angle to angle of prospect
    set subjectLine to "AI phone demo for " & restaurantName
    set bodyText to "Hey " & restaurantName & " team," & return & return & "I built a working AI phone agent demo for restaurants and catering teams:" & return & demoLink & return & return & "For " & restaurantName & ", the practical use case looks like " & angle & ". The agent answers when staff are busy, captures the order/reservation/catering request, asks confirmation questions, suggests simple add-ons, and sends staff a clean handoff." & return & return & "I used to lead mobile app work for Subway, so the flow is built around quick-service order capture and upsells rather than generic chat." & return & return & "I can configure it around your menu and call flow in one afternoon. Setup is $2,997:" & return & setupLink & return & return & "Open to a 10-minute look this week?" & return & return & "Best," & return & "Igor" & return & "Former Subway Mobile App Lead"
    set outgoingMessage to make new outgoing message with properties {subject:subjectLine, content:bodyText, visible:false}
    tell outgoingMessage
      make new to recipient at end of to recipients with properties {address:recipientEmail}
      send
    end tell
    delay 2
  end repeat
end tell

return "sent " & (count of prospects) & " messages"
