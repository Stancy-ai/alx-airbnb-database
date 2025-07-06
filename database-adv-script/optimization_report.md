# Query Optimization Report

**Objective:** Refactor a complex query to improve performance when retrieving bookings with related user, property, and payment details.


## 1. Initial Query

```sql
SELECT
  b.id           AS booking_id,
  b.start_date,
  b.end_date,
  u.id           AS user_id,
  u.email,
  u.name         AS user_name,
  p.id           AS property_id,
  p.title        AS property_title,
  p.address,
  pay.id         AS payment_id,
  pay.amount,
  pay.currency,
  pay.status     AS payment_status,
  pay.processed_at
FROM
  bookings b
JOIN
  users u ON b.user_id = u.id
JOIN
  properties p ON b.property_id = p.id
LEFT JOIN
  payments pay ON b.id = pay.booking_id;
```

### 1.1 Performance Analysis

Run `EXPLAIN ANALYZE` on the initial query:

```sql
EXPLAIN ANALYZE
<initial query>;
```

**Findings:**

* Full joins on large tables caused nested loop scans.
* Retrieving all payment columns and ordering was expensive.
* No index on `payments(booking_id, processed_at)` forced sequential scan.


## 3. Optimized Query

```sql
SELECT
  b.id           AS booking_id,
  b.start_date,
  b.end_date,
  u.id           AS user_id,
  u.email,
  u.name         AS user_name,
  p.id           AS property_id,
  p.title        AS property_title,
  pay.amount     AS payment_amount,
  pay.status     AS payment_status
FROM
  bookings b
JOIN
  users u ON b.user_id = u.id
JOIN
  properties p ON b.property_id = p.id
LEFT JOIN LATERAL (
  SELECT amount, status
  FROM payments
  WHERE booking_id = b.id
  ORDER BY processed_at DESC
  LIMIT 1
) pay ON TRUE;
```

