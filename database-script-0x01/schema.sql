-- Airbnb Clone Project Schema



-- ========================================
-- USERS TABLE
-- ========================================

CREATE TABLE users (
    user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    role VARCHAR(20) CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_users_email ON users(email);

-- ========================================
-- PROPERTIES TABLE
-- ========================================

CREATE TABLE properties (
    property_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    host_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    price_per_night DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_properties_host_id ON properties(host_id);

-- ========================================
-- BOOKINGS TABLE
-- ========================================

CREATE TABLE bookings (
    booking_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID REFERENCES properties(property_id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- ========================================
-- PAYMENTS TABLE
-- ========================================

CREATE TABLE payments (
    payment_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    booking_id UUID REFERENCES bookings(booking_id) ON DELETE CASCADE,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(20) CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL
);

CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- ========================================
-- REVIEWS TABLE
-- ========================================

CREATE TABLE reviews (
    review_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    property_id UUID REFERENCES properties(property_id) ON DELETE CASCADE,
    user_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_user_id ON reviews(user_id);

-- ========================================
-- MESSAGES TABLE
-- ========================================

CREATE TABLE messages (
    message_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sender_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    recipient_id UUID REFERENCES users(user_id) ON DELETE CASCADE,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_messages_sender_id ON messages(sender_id);
CREATE INDEX idx_messages_recipient_id ON messages(recipient_id);
