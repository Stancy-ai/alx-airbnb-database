# Airbnb Clone Database Design

 This repository contains the complete structured workflow. 

## Project Overview

This project covers:

Designing  Entity-Relationship (ER) diagram.
Normalize 
Creating SQL schemas** with constraints, indexing, and integrity.
Populating the database with realistic, relational sample data** for testing and learning.

It is designed to help you practice:

Database modeling
SQL DDL and DML
Data integrity enforcement
Query optimization preparation
API/backend integration readiness


## 1. ER Diagram

![ER Diagram](er_diagram.png)

Key Entities:

User: guests, hosts, admins
Property: listed by hosts
Booking: user reservations for properties
Payment: linked to bookings
Review: user reviews on properties
Message: user-to-user communications

Relationships:

Users can host properties.
Users can book properties.
Payments are tied to bookings.
Users can leave reviews for properties.
Users can message other users.

The schema is designed to meet 3rd Normal Form (3NF), ensuring data integrity** and reducing redundancy.


##  2. SQL Schema

File: [`create_tables.sql`](create_tables.sql)

Features:

Uses `uuid` as primary keys for scalability.
Enforces `NOT NULL`, `UNIQUE`, and `CHECK` constraints.
Establishes foreign key relationships between tables.
Implements ENUM constraints for fields like `role`, `status`, and `payment_method`.
Includes indexing for `email`, `property_id`, and `booking_id` for efficient queries.

 3. Seed Data

File: [`seed_data.sql`](seed_data.sql)

Features:

Populates realistic test data: users, properties, bookings, payments, reviews, messages.
Ensures relationships are respected (e.g., users are linked correctly to bookings and payments).
Helps test your SQL queries and backend integrations with meaningful, relational data.