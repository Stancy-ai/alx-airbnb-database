-- Advanced SQL JOIN Queries for Airbnb Clone Database

-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM
    Booking
INNER JOIN
    Users u ON Booking.user_id = User.user_id;
    

-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews

SELECT
    Property.property_id,
    Property.name AS property_name,
    Property.location,
    Property.pricepernight,
    Review.review_id,
    Review.rating,
    Review.comment
FROM
    Property
LEFT JOIN
    Review ON Property.property_id = Review.property_id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
SELECT
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Booking.booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM
    User
FULL OUTER JOIN
    Booking ON User.user_id = Booking.user_id;


-- 4. 