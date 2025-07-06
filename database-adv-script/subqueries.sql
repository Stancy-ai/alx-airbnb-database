-- Advanced SQL Subqueries for Airbnb Clone Database

-- 1. Non-Correlated Subquery: Find all properties with average rating greater than 4.0

SELECT
    property_id,
    name,
    location,
    pricepernight
FROM
    Property
WHERE
    property_id IN (
        SELECT
            property_id
        FROM
            Review
        GROUP BY
            property_id
        HAVING
            AVG(rating) > 4.0
    );

-- 2. Correlated Subquery: Find all users who have made more than 3 bookings

SELECT
    user_id,
    first_name,
    last_name,
    email
FROM
    User u
WHERE
    (
        SELECT
            COUNT(*)
        FROM
            Booking b
        WHERE
            b.user_id = u.user_id
    ) > 3;

