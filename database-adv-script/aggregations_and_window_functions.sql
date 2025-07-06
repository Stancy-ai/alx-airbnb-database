-- Advanced SQL Aggregations & Window Functions for Airbnb Clone Database

-- 1. Aggregation: Total number of bookings made by each user
SELECT 
    user_id,
    COUNT(*) AS total_bookings
FROM 
    Booking
GROUP BY 
    user_id
ORDER BY 
    total_bookings DESC;

-- 2. Window Function (RANK): Rank properties based on total number of bookings received

-- 3.-- 3. Window Function (ROW\_NUMBER): Assign sequential numbers to properties by booking count
SELECT
    property_id,
    total_bookings,
    RANK() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM (
    SELECT 
        property_id,
        COUNT(*) AS total_bookings
    FROM 
        Booking
    GROUP BY 
        property_id
) AS property_booking_counts;
