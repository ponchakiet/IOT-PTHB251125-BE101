BEGIN;
UPDATE flights
SET available_seats = available_seats - 1
WHERE flight_id = 'VN123';
INSERT INTO bookings(flight_id, customer_name)
VALUES ('VN123', 'Nguyen Van A');
COMMIT;

SELECT * FROM flights WHERE flight_id = 'VN123';
SELECT * FROM bookings;

BEGIN;
UPDATE flights
SET available_seats = available_seats - 1
WHERE flight_id = 'VN123';
INSERT INTO bookings(flight_id, customer_name)
VALUES ('VN999', 'Nguyen Van A');
ROLLBACK;
SELECT * FROM flights WHERE flight_id = 'VN123';
SELECT * FROM bookings;