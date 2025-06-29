# Database Normalization to 3NF for Airbnb clone Porject



The normalization explains how  database design follows Third Normal Form (3NF) for efficiency, scalability, and data integrity.

Entities Reviewed

User
Property
Booking
Payment
Review
Message

Step 1: First Normal Form (1NF)

All tables have atomic (indivisible) values.
There are *no repeating groups** or arrays in any column.
 Example:

  `User` has one `email` per record.
  `Booking` has one `start_date` and `end_date` per record.


Step 2: Second Normal Form (2NF)

The database is already in 1NF.
All non-key attributes are fully dependent on the entire primary key**.
All tables use single-column primary keys (`UUID`), avoiding partial dependencies.



Step 3: Third Normal Form (3NF)

The database meets 2NF.
No transitive dependencies**:

   All non-key attributes depend only on the primary key**.
  Example:

    In `Booking`, `total_price` depends on `booking_id`.
    In `Property`, `host_id` is a foreign key to `User`, avoiding data duplication.
    In `Review`, `rating` and `comment` depend directly on `review_id`.



Additional Design Highlights

Enums (`role`, `status`, `payment_method`) enforce valid value constraints.
Foreign Key Constraints** maintain referential integrity:

  `Property.host_id` → `User.user_id`
  `Booking.property_id` → `Property.property_id`
  `Booking.user_id` → `User.user_id`
  `Payment.booking_id` → `Booking.booking_id`
  `Review.property_id` → `Property.property_id`
  `Review.user_id` → `User.user_id`
  `Message.sender_id` → `User.user_id`
  `Message.recipient_id` → `User.user_id`
Indexing is in place for frequently queried fields (e.g., `email`, `property_id`, `booking_id`).


Conclusion

The database design for the Airbnb clone project is fully normalized to 3NF:
Reducing Redundancy
improving data consistency
ensuring scalability.
