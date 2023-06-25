CREATE TABLE "Customers" (
  "customer_id" SERIAL,
  "first_name" VARCHAR(20),
  "last_name" VARCHAR(20),
  "address" VARCHAR(100),
  "phone_number" VARCHAR(15),
  PRIMARY KEY ("customer_id")
);

CREATE TABLE "Parts" (
  "parts_id" SERIAL,
  "parts_name" VARCHAR(50),
  "parts_number" INTEGER,
  "invoice_id" INTEGER,
  "service_car_id" INTEGER,
  PRIMARY KEY ("parts_id")
);

CREATE TABLE Invoice (
  invoice_id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  payments BOOLEAN,
  amount NUMERIC(10,2),
  CONSTRAINT FK_Invoice_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES "Customers" (customer_id)
);

CREATE TABLE "Salesperson" (
  "salesperson_id" SERIAL,
  "first_name" VARCHAR(20),
  "last_name" VARCHAR(20),
  "service_car_id" INTEGER,
  PRIMARY KEY ("salesperson_id")
);

CREATE TABLE "Service" (
  "servive_id" SERIAL,
  "description" VARCHAR(100),
  "service _car_id" INTEGER,
  PRIMARY KEY ("servive_id")
);

CREATE TABLE NewCars (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(20),
  model VARCHAR(20),
  year INTEGER,
  salesperson_id INTEGER,
  customer_id INTEGER,
  CONSTRAINT FK_NewCars_salesperson_id
    FOREIGN KEY (salesperson_id)
    REFERENCES "Salesperson" (salesperson_id),
  CONSTRAINT FK_NewCars_customer_id
    FOREIGN KEY (customer_id)
    REFERENCES "Customers" (customer_id)
);

CREATE TABLE Service (
  service_id_column SERIAL PRIMARY KEY,
  description VARCHAR(100) UNIQUE,
  service_car_id INTEGER,
  CONSTRAINT FK_Service_service_car_id
    FOREIGN KEY (service_car_id)
    REFERENCES "Salesperson" (salesperson_id)
	
);

CREATE TABLE "Mechanic" (
  "mechanic" SERIAL,
  "first_name" VARCHAR(20),
  "last_name" VARCHAR(20),
  "service_car_id" INTEGER,
  PRIMARY KEY ("mechanic")
);
