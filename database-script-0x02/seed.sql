

-- ========================================
-- INSERT USERS
-- ========================================
INSERT INTO users (user_id, first_name, last_name, email, created_at, password_hash, phone_number, role)
VALUES
(uuid_generate_v4(), 'Theresa', 'Seyram', 'theresa@gmail.com.com', 'hashed_password_1', '+233201234567', 'host', 'created_a't ),
(uuid_generate_v4(), 'Kwadwo', 'Donkor', 'kwadwo@gmail.com', 'hashed_password_2', '+233501112233', 'guest', 'created_at'),
(uuid_generate_v4(), 'Kofi', 'Anane', 'anane@example.com', 'hashed_password_3', '+226241234567', 'guest', 'created_at'),
(uuid_generate_v4(), 'Agnes', 'Armah', 'agnesarmah@gmail.com', 'hashed_password_4', '+14155552671', 'host', 'created_at');

-- ========================================
-- INSERT PROPERTIES
-- ========================================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
(uuid_generate_v4(),
    (SELECT user_id FROM users WHERE email = 'theresa@example.com'),
    'Cozy Apartment in Accra',
    'A fully furnished cozy apartment in East Legon with WiFi.',
    'Accra, Ghana',
    45.00),
(uuid_generate_v4(),
    (SELECT user_id FROM users WHERE email = 'anane@example.com'),
    'Beachfront Cabin',
    'Beautiful beachfront cabin with a stunning ocean view.',
    'Cape Coast, Ghana',
    70.00);

-- ========================================
-- INSERT BOOKINGS
-- ========================================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
(uuid_generate_v4(),
    (SELECT property_id FROM properties WHERE name = 'Cozy Apartment in Accra'),
    (SELECT user_id FROM users WHERE email = 'kwadwo@example.com'),
    '2025-07-01',
    '2025-07-05',
    180.00,
    'confirmed'),
(uuid_generate_v4(),
    (SELECT property_id FROM properties WHERE name = 'Beachfront Cabin'),
    (SELECT user_id FROM users WHERE email = 'Kofi@example.com'),
    '2025-08-10',
    '2025-08-15',
    350.00,
    'pending');

-- ========================================
-- INSERT PAYMENTS
-- ========================================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
(uuid_generate_v4(),
    (SELECT booking_id FROM bookings WHERE total_price = 180.00),
    180.00,
    'credit_card'),
(uuid_generate_v4(),
    (SELECT booking_id FROM bookings WHERE total_price = 350.00),
    350.00,
    'paypal');

-- ========================================
-- INSERT REVIEWS
-- ========================================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
(uuid_generate_v4(),
    (SELECT property_id FROM properties WHERE name = 'Cozy Apartment in Accra'),
    (SELECT user_id FROM users WHERE email = 'kwame@example.com'),
    5,
    'Amazing stay, clean and well located. Highly recommended!'),
(uuid_generate_v4(),
    (SELECT property_id FROM properties WHERE name = 'Beachfront Cabin'),
    (SELECT user_id FROM users WHERE email = 'akosua@example.com'),
    4,
    'Beautiful view, but the WiFi was a bit slow.');

-- ========================================
-- INSERT MESSAGES
-- ========================================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
(uuid_generate_v4(),
    (SELECT user_id FROM users WHERE email = 'kwame@example.com'),
    (SELECT user_id FROM users WHERE email = 'theresa@example.com'),
    'Hi Theresa, I loved your apartment, thank you for hosting me!'),
(uuid_generate_v4(),
    (SELECT user_id FROM users WHERE email = 'akosua@example.com'),
    (SELECT user_id FROM users WHERE email = 'james@example.com'),
    'Hi Agnes, looking forward to my stay at your beachfront cabin!');


