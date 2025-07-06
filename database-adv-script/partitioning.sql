-- Partitioning the bookings table by start_date to optimize query performance
-- Step 1: Rename the original Booking table
ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions for each year
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Copy data from old table into new partitioned table
INSERT INTO Booking
SELECT * FROM Booking_old;

-- Step 5: Drop the old table if needed (optional, backup first)
-- DROP TABLE Booking_old;

-- Example performance test: Query to fetch bookings in May 2025
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
