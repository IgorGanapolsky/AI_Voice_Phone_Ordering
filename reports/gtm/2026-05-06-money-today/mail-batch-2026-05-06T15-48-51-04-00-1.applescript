on run argv
  set restaurantName to "Rice Mediterranean Kitchen"
  set emailAddress to "Catering@ricekitchen.com"
  set subjectLine to "Quick phone-flow idea for " & restaurantName
  set bodyText to "Hey Rice Mediterranean Kitchen team," & return & "" & return & "I saw your public catering contact details." & return & "" & return & "I led mobile app work for Subway and am testing a same-day AI phone audit for restaurants/caterers: missed calls, order questions, add-ons, and staff handoff." & return & "" & return & "Want a 3-point phone-flow teardown for Rice Mediterranean Kitchen? Reply yes. Paid same-day option: https://buy.stripe.com/eVq8wPaiEcXAf0l5e33sI17" & return & "" & return & "Demo page: https://igorganapolsky.github.io/AI_Voice_Phone_Ordering/" & return & "" & return & "Best," & return & "Igor Ganapolsky" & return & "Former Subway Mobile App Team Lead | AI Automation for Restaurants" & return & "201 639 1534" & return & "" & return & "--" & return & "Ad/solicitation disclosure: I am reaching out about a paid restaurant automation service." & return & "Opt out: reply \"no\" and I will not contact you again." & return & "Mailing address: 11909 Glenmore Dr, Coral Springs, FL 33071"
  with timeout of 300 seconds
    tell application "Mail"
      set newMessage to make new outgoing message with properties {subject:subjectLine, content:bodyText, visible:false}
      tell newMessage
        make new to recipient at end of to recipients with properties {address:emailAddress}
        send
      end tell
    end tell
  end timeout
  return restaurantName & "," & emailAddress
end run
