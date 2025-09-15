
VAT = 0.19

puts "Seeding Rooms..."
rooms = [
  { number: "101", room_type: 0, price: 45000, status: 0 }, # 0: available
  { number: "102", room_type: 1, price: 65000, status: 0 }, # 1: double
  { number: "201", room_type: 2, price: 120000, status: 0 } # 2: suite
].map { |attrs| Room.create!(attrs) }

puts "Seeding Guests..."
guests = [
  { first_name: "Ana", last_name: "Pérez", email: "ana@example.com", phone: "+56 9 1234 5678", document_id: "ID1001" },
  { first_name: "Bruno", last_name: "González", email: "bruno@example.com", phone: "+56 9 2345 6789", document_id: "ID1002" },
  { first_name: "Carla", last_name: "Rojas", email: "carla@example.com", phone: "+56 9 3456 7890", document_id: "ID1003" }
].map { |attrs| Guest.create!(attrs) }

puts "Seeding Services..."
services = [
  { name: "Breakfast", price: 8000, is_active: true },
  { name: "Laundry",   price: 3500, is_active: true }
].map { |attrs| Service.create!(attrs) }

puts "Seeding Reservations..."
today = Date.today
res1 = Reservation.create!(
  code: "RES1000",
  guest_id: guests.first.id,
  room_id: rooms.first.id,
  check_in: today,
  check_out: today + 2, # 2 nights
  status: 1,            # 1: confirmed
  adults: 2,
  children: 0
)
res2 = Reservation.create!(
  code: "RES1001",
  guest_id: guests.second.id,
  room_id: rooms.second.id,
  check_in: today + 1,
  check_out: today + 4, # 3 nights
  status: 0,            # 0: pending
  adults: 1,
  children: 1
)

puts "Seeding Service Usages..."
ServiceUsage.create!(
  reservation_id: res1.id,
  service_id: services.first.id, # Breakfast
  quantity: 2,
  used_at: (res1.check_in.to_time + 9.hours),
  note: "Both guests"
)
ServiceUsage.create!(
  reservation_id: res2.id,
  service_id: services.last.id, # Laundry
  quantity: 1,
  used_at: (res2.check_in.to_time + 18.hours),
  note: "Express"
)

puts "Seeding Invoices..."
[res1, res2].each do |res|
  room  = rooms.find { |r| r.id == res.room_id }
  nights = (res.check_out - res.check_in).to_i
  nights_subtotal = room.price * nights

  sus = ServiceUsage.where(reservation_id: res.id)
  services_subtotal = sus.sum do |su|
    svc = services.find { |s| s.id == su.service_id }
    svc.price * su.quantity
  end

  tax   = ((nights_subtotal + services_subtotal) * VAT).round
  total = nights_subtotal + services_subtotal + tax

  Invoice.create!(
    reservation_id: res.id,
    nights_subtotal: nights_subtotal,
    services_subtotal: services_subtotal,
    tax: tax,
    total: total,
    issued_at: res.check_out.to_time + 11.hours,
    status: "issued"
  )
end

puts "Done. Rooms: #{Room.count}, Guests: #{Guest.count}, Reservations: #{Reservation.count}, Services: #{Service.count}, ServiceUsages: #{ServiceUsage.count}, Invoices: #{Invoice.count}"
