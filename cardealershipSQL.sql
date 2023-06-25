INSERT INTO "Customers" ("first_name", "last_name", "address", "phone_number")
VALUES ('John', 'Doe', '123 Main Street', '555-1234'),
       ('Jane', 'Smith', '456 Elm Avenue', '555-5678'),
       ('Michael', 'Johnson', '789 Oak Street', '555-9012'),
       ('Sarah', 'Williams', '321 Pine Avenue', '555-3456'),
       ('David', 'Brown', '567 Maple Lane', '555-7890');


INSERT INTO "Parts" ("parts_name", "parts_number", "invoice_id", "service_car_id")
VALUES ('Engine Oil', 41, 12345, 6789),
       ('Air Filter', 43, 10111,21314),
       ('Brake Pads', 45, 15161,71819),
       ('Spark Plugs', 47, 20212, 22324),
       ('Battery', 49, 25262, 72829);
	   

INSERT INTO Invoice ("customer_id", "payments", "amount")
VALUES (1, true, 100.00),
       (2, false, 200.00),
       (3, true, 150.00),
       (4, true, 300.00),
       (5, false, 250.00);



-- Sample data for "Salesperson" table
INSERT INTO "Salesperson" ("first_name", "last_name", "service_car_id")
VALUES ('Emily', 'Davis', 30313),
       ('Michael', 'Brown', 23334),
       ('Jessica', 'Wilson', 35363),
       ('Daniel', 'Taylor', 73839),
       ('Sophia', 'Anderson', 40414);
	   

INSERT INTO "Service" ("description", "service _car_id")
VALUES ('Oil Change', 40414),
       ('Tire Rotation', 73839),
       ('Brake Inspection', 35363),
       ('Air Conditioning Service', 23334),
       ('Engine Diagnostic', 30313);
	   

INSERT INTO NewCars ("make", "model", "year", "salesperson_id", "customer_id")
VALUES ('Toyota', 'Camry', 2022, 1, 1),
       ('Honda', 'Civic', 2023, 2, 2),
       ('Ford', 'Mustang', 2021, 3, 3),
       ('Chevrolet', 'Silverado', 2022, 4, 4),
       ('Nissan', 'Altima', 2023, 5, 5);

-- Sample data for "Mechanic" table
INSERT INTO "Mechanic" ("first_name", "last_name", "service_car_id")
VALUES ('Andrew', 'Jones', 24344),
       ('Olivia', 'Martinez', 45464),
       ('James', 'Clark', 74849),
       ('Ava', 'Garcia', 50515),
       ('Benjamin', 'Smith', 25354);
	   
SELECT *
FROM "Mechanic";

ALTER TABLE NewCars
ADD COLUMN "is_serviced" BOOLEAN DEFAULT FALSE;

CREATE OR REPLACE PROCEDURE UpdateServiceStatus(p_car_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM NewCars
        WHERE car_id = p_car_id
          AND is_serviced = FALSE
    ) THEN
        RETURN;
    END IF;

    IF EXISTS (
        SELECT 1
        FROM Service
        WHERE description = 'Oil Change'
          AND service_car_id = p_car_id
    ) THEN
        UPDATE NewCars
        SET is_serviced = TRUE
        WHERE car_id = p_car_id;
    END IF;
END;
$$;

CALL UpdateServiceStatus(40414);
