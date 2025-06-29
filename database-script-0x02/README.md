
#  Airbnb Clone Database Sample Data

The `seed_data.sql` to populate your Airbnb Clone PostgreSQL database with realistic, structured sample data to support development and testing.

## What it Does

Populates:

Users (hosts, guests)
Properties (linked to hosts)
Bookings (linked to users and properties)
Payments (linked to bookings)
Reviews (linked to users and properties)
Messages (between users)

Uses `uuid_generate_v4()` for primary keys.

Ensures realistic data flows for meaningful testing.

Supports query practice for joins, aggregates, and constraints**.

## Files

`seed_data.sql`: SQL INSERT statements to populate your PostgreSQL database after schema creation.

## Usage

1️⃣ Ensure your database schema is created using `create_tables.sql`.
2️⃣ Enable the UUID extension in your database:

```sql
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
```

Run:

```bash
psql -U <username> -d <your_database> -f seed_data.sql
```

or

```sql
\i path/to/seed_data.sql
```

Verify data:

```sql
SELECT * FROM users;
SELECT * FROM properties;
SELECT * FROM bookings;
SELECT * FROM payments;
SELECT * FROM reviews;
SELECT * FROM messages;
```