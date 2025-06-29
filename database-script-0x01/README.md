

#  Airbnb Clone SQL Schema

## Overview

 The SQL schema** for the Airbnb clone backend system  designed to manage users, properties, bookings, payments, reviews, and messaging with data integrity and scalability in mind.

The schema is normalized to 3NF, ensuring clean relational structure and efficient querying for production use.


Schema Features

Uses UUID as primary keys for global uniqueness.
Enforces foreign key constraints for referential integrity.
Includes CHECK constraints for data validation (e.g., ratings range, ENUM simulations).
Indexed fields for optimized query performance.
Tracks timestamps for creation and updates.


## Tables Included

User: Stores user profiles, roles, and authentication information.
Property: Stores host property listings with pricing and location.
Booking: Tracks guest reservations linked to properties and users.
Payment: Manages payments linked to bookings.
Review: Stores guest reviews and ratings for properties.
Message: Handles messaging between users.


## Tech Stack

PostgreSQL(compatible with MySQL with minor adjustments)
UUID handling via `uuid-ossp` extension
Utilizes TIMESTAMP and DATE for time-based fields


