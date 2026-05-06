const menu = [
  { id: "turkey_6", name: "Turkey Breast", size: "6 inch", category: "sub", price: 6.99, keywords: ["turkey"], upsell: "Make it a combo with chips and a fountain drink for $3.99 more." },
  { id: "turkey_12", name: "Turkey Breast", size: "footlong", category: "sub", price: 11.99, keywords: ["turkey"], upsell: "Add cookies for the group while the sandwiches are being made." },
  { id: "italian_bmt_6", name: "Italian BMT", size: "6 inch", category: "sub", price: 7.49, keywords: ["italian", "bmt"], upsell: "Make it a combo with chips and a fountain drink for $3.99 more." },
  { id: "italian_bmt_12", name: "Italian BMT", size: "footlong", category: "sub", price: 12.99, keywords: ["italian", "bmt"], upsell: "Add double meat for a heartier meal." },
  { id: "chicken_6", name: "Rotisserie Chicken", size: "6 inch", category: "sub", price: 7.99, keywords: ["chicken", "rotisserie"], upsell: "Make it a combo with chips and a fountain drink for $3.99 more." },
  { id: "steak_6", name: "Steak and Cheese", size: "6 inch", category: "sub", price: 8.49, keywords: ["steak", "cheese"], upsell: "Add double cheese or make it a combo." },
  { id: "chopped_salad", name: "Chopped Turkey Salad", size: "regular", category: "salad", price: 8.99, keywords: ["salad"], upsell: "Add bottled water for $1.99." },
  { id: "chips", name: "Chips", size: "bag", category: "side", price: 1.79, keywords: ["chips"], upsell: "Add a fountain drink." },
  { id: "cookie", name: "Chocolate Chip Cookie", size: "each", category: "side", price: 0.99, keywords: ["cookie"], upsell: "Add two more cookies for the table." },
  { id: "drink", name: "Fountain Drink", size: "regular", category: "drink", price: 2.49, keywords: ["drink", "soda", "coke"], upsell: "Upgrade to a large drink." }
];

const state = {
  calls: 0,
  orders: 0,
  subtotal: 0,
  seconds: 0,
  timer: null
};

const transcriptLog = document.querySelector("#transcript-log");
const staffLog = document.querySelector("#staff-log");
const form = document.querySelector("#call-form");
const input = document.querySelector("#message-input");

function money(value) {
  return `$${value.toFixed(2)}`;
}

function renderMenu() {
  const list = document.querySelector("#menu-list");
  menu
    .filter((item) => ["sub", "salad", "side", "drink"].includes(item.category))
    .slice(0, 8)
    .forEach((item) => {
      const li = document.createElement("li");
      li.innerHTML = `<strong>${item.name}</strong><span>${money(item.price)}</span>`;
      list.appendChild(li);
    });
}

function addMessage(type, text) {
  const message = document.createElement("div");
  message.className = `message ${type}`;
  message.textContent = text;
  transcriptLog.appendChild(message);
  transcriptLog.scrollTop = transcriptLog.scrollHeight;
}

function updateMetrics() {
  document.querySelector("#calls-count").textContent = String(state.calls);
  document.querySelector("#orders-count").textContent = String(state.orders);
  document.querySelector("#subtotal-total").textContent = money(state.subtotal);
}

function updateTimer() {
  const minutes = String(Math.floor(state.seconds / 60)).padStart(2, "0");
  const seconds = String(state.seconds % 60).padStart(2, "0");
  document.querySelector("#call-timer").textContent = `${minutes}:${seconds}`;
}

function startCallClock() {
  clearInterval(state.timer);
  state.seconds = 0;
  updateTimer();
  state.timer = setInterval(() => {
    state.seconds += 1;
    updateTimer();
  }, 1000);
}

function matchMenuItems(text) {
  const normalized = text.toLowerCase();
  const wantsFootlong = /footlong|12|twelve/.test(normalized);
  const quantityMatch = normalized.match(/\b(two|three|four|five|six|\d+)\b/);
  const quantityMap = { two: 2, three: 3, four: 4, five: 5, six: 6 };
  const quantity = quantityMatch ? Number(quantityMap[quantityMatch[1]] || quantityMatch[1]) : 1;
  let matches = menu.filter((item) => item.keywords.some((keyword) => normalized.includes(keyword)));

  if (wantsFootlong) {
    matches = matches.map((item) => menu.find((candidate) => candidate.name === item.name && candidate.size === "footlong") || item);
  }

  const deduped = [...new Map(matches.map((item) => [item.id, item])).values()];
  return deduped.map((item) => ({ ...item, quantity: Math.max(quantity, 1) }));
}

function parseReservation(text) {
  const normalized = text.toLowerCase();
  const partyMatch = normalized.match(/\b(for|party of)\s+(one|two|three|four|five|six|seven|eight|\d+)/);
  const timeMatch = normalized.match(/\b(?:at|around)\s+(\d{1,2})(?::(\d{2}))?\s*(am|pm)?/);
  const partyMap = { one: 1, two: 2, three: 3, four: 4, five: 5, six: 6, seven: 7, eight: 8 };
  const partySize = partyMatch ? Number(partyMap[partyMatch[2]] || partyMatch[2]) : 2;
  const time = timeMatch ? `${timeMatch[1]}${timeMatch[2] ? `:${timeMatch[2]}` : ":00"} ${timeMatch[3] || "PM"}`.toUpperCase() : "next available";
  return { partySize, time };
}

function classifyCall(text) {
  const normalized = text.toLowerCase();
  if (/book|reserve|reservation|table|party of/.test(normalized)) return "reservation";
  if (/open|still taking|closed|hours|missed|call back/.test(normalized)) return "missed_call_recovery";
  if (/order|pickup|delivery|footlong|sandwich|sub|meal|salad|turkey|italian|steak|chicken/.test(normalized)) return "order";
  return "menu_help";
}

function buildReply(text) {
  const intent = classifyCall(text);

  if (intent === "reservation") {
    const reservation = parseReservation(text);
    return {
      intent,
      reply: `I can help with that. I have a table for ${reservation.partySize} at ${reservation.time}. May I confirm the name and phone number for the reservation?`,
      staffSummary: `Reservation lead: party of ${reservation.partySize}, requested ${reservation.time}. Agent asked for name and confirmation.`,
      subtotal: 0
    };
  }

  if (intent === "missed_call_recovery") {
    return {
      intent,
      reply: "Yes, we are still taking pickup orders. I can take the order now, quote the estimated total, and send it to the staff line for confirmation.",
      staffSummary: "Missed-call recovery: caller asked whether orders are still open. Agent kept caller on the line and invited a pickup order.",
      subtotal: 0
    };
  }

  if (intent === "menu_help") {
    return {
      intent,
      reply: "Popular phone orders are Turkey Breast, Italian BMT, Steak and Cheese, Rotisserie Chicken, and chopped salads. I can also make any sandwich a meal with chips and a fountain drink.",
      staffSummary: "Menu help call: agent answered options and offered meal conversion.",
      subtotal: 0
    };
  }

  let items = matchMenuItems(text);
  if (!items.length) {
    items = [{ ...menu.find((item) => item.id === "turkey_6"), quantity: 1 }];
  }

  const subtotal = items.reduce((sum, item) => sum + item.price * item.quantity, 0);
  const hasSide = items.some((item) => ["side", "drink"].includes(item.category));
  const primary = items.find((item) => item.category === "sub" || item.category === "salad") || items[0];
  const upsell = hasSide ? primary.upsell : "Would you like to make those meals with chips and fountain drinks for $3.99 each?";
  const itemList = items.map((item) => `${item.quantity} ${item.name} ${item.size}`).join(", ");

  return {
    intent,
    reply: `Got it: ${itemList} for pickup. Estimated subtotal is ${money(subtotal)} before tax. ${upsell}`,
    staffSummary: `Pickup order draft: ${itemList}. Subtotal ${money(subtotal)} before tax. Upsell offered: ${upsell}`,
    subtotal
  };
}

function addStaffTicket(result) {
  staffLog.querySelector(".empty-state")?.remove();
  const ticket = document.createElement("div");
  ticket.className = `ticket ${result.intent}`;
  ticket.textContent = result.staffSummary;
  staffLog.prepend(ticket);
}

function handleCall(text) {
  state.calls += 1;
  startCallClock();
  addMessage("customer", `Caller: ${text}`);

  const result = buildReply(text);
  document.querySelector("#call-intent").textContent = result.intent.replaceAll("_", " ");
  addMessage("agent", `Agent: ${result.reply}`);

  if (result.intent === "order") {
    state.orders += 1;
    state.subtotal += result.subtotal;
  }

  addStaffTicket(result);
  updateMetrics();
}

form.addEventListener("submit", (event) => {
  event.preventDefault();
  const text = input.value.trim();
  if (!text) return;
  input.value = "";
  handleCall(text);
});

document.querySelectorAll("[data-message]").forEach((button) => {
  button.addEventListener("click", () => handleCall(button.dataset.message));
});

renderMenu();
updateMetrics();
addMessage("agent", "Agent: Thanks for calling Miami Sandwich Co. I can help with pickup orders, reservations, hours, and menu questions. What can I help you with?");
