## Room management
- **As a receptionist**, I want to register a new room with its type, price, and current status so that it is available for future reservations.
- **As a receptionist**, I want to update a room’s status (available, occupied, maintenance) so that I can reflect real-time availability.
- **As an operations manager**, I want to list rooms filtered by type and status so that I can plan housekeeping and maintenance.


### Acceptance Criteria
- I can create a room providing: number, room_type, price, status.
- I can view a list of rooms and see type/price/status.
- I can change a room’s status.


## Guest registration
- **As a receptionist**, I want to register a guest with contact and ID info so that I can create reservations for them.
- **As a receptionist**, I want to search guests by name/email/document so that I can quickly find them at check-in.


### Acceptance Criteria
- I can create a guest with first_name, last_name, email, phone, document_id.
- I can list and search guests.


## Reservation creation & room assignment
- **As a receptionist**, I want to create a reservation with check-in/check-out dates, guest, and room so that I can secure a stay.
- **As a receptionist**, I want to set the number of adults and children so that capacity is recorded.
- **As a receptionist**, I want to set an initial reservation status (pending/confirmed) so that the workflow is clear.


### Acceptance Criteria
- I can create a reservation with: code, guest_id, room_id, check_in, check_out, status, adults, children.
- I can list reservations and see their key fields.


## Service consumption tracking
- **As a receptionist**, I want to register a service consumption for a reservation so that it appears on the final bill.
- **As a receptionist**, I want to add a note and time of use so that staff can audit service usage.


### Acceptance Criteria
- I can create a service usage with: reservation_id, service_id, quantity, used_at, note.


## Check‑in and check‑out
- **As a receptionist**, I want to mark a reservation as checked‑in at arrival so that room status and billing can proceed.
- **As a receptionist**, I want to mark a reservation as checked‑out at departure so that I can trigger invoice generation.


### Acceptance Criteria
- I can update reservation status to: pending, confirmed, checked_in, checked_out, canceled.


## Invoice generation
- **As a receptionist**, I want to generate an invoice for a reservation so that the guest can pay the correct total.
- **As an accountant**, I want to see nights subtotal, services subtotal, tax (19%), and total so that amounts are transparent.


### Acceptance Criteria
- I can create an invoice with: reservation_id, nights_subtotal, services_subtotal, tax, total, issued_at, status (e.g., "draft", "issued", "paid").