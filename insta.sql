-- Active: 1699002354934@@Localhost@3306@insta

create database insta;

use insta;

CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(254) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone_number BIGINT(10)
);

CREATE TABLE contactform (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(254) NOT NULL,
    message TEXT NOT NULL
);

CREATE TABLE dairy (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    image TEXT NOT NULL,
    quantity INTEGER(50) NOT NULL,
    price NUMERIC(6, 2) NOT NULL
);

CREATE TABLE deliverydetails (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    email VARCHAR(254) NOT NULL,
    locality_apartment VARCHAR(100) NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    contact_number INTEGER(15) NOT NULL,
    date DATE NOT NULL,
    time_slot VARCHAR(100) NOT NULL
);

CREATE TABLE fruit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    image TEXT NOT NULL,
    quantity VARCHAR(50) NOT NULL,
    price NUMERIC(6, 2) NOT NULL
);

CREATE TABLE grain (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    image TEXT NOT NULL,
    quantity VARCHAR(50) NOT NULL,
    price NUMERIC(6, 2) NOT NULL
);

CREATE TABLE Payment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    card_number VARCHAR(16) NOT NULL,
    card_holder_name VARCHAR(100) NOT NULL,
    expiry_month VARCHAR(2) NOT NULL,
    expiry_year VARCHAR(4) NOT NULL,
    cvv VARCHAR(4) NOT NULL
);

CREATE TABLE customerprofile (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    birthday DATE NOT NULL,
    email VARCHAR(254) NOT NULL,
    password VARCHAR(100) NOT NULL,
    billing_address VARCHAR(200) NOT NULL,
    pincode VARCHAR(10) NOT NULL,
    last_order_shipped_on DATE NOT NULL,
    redeem_card VARCHAR(100) NOT NULL,
    payment_date DATE NOT NULL,
    next_payment_date DATE NOT NULL,
    plan VARCHAR(50) NOT NULL,
    manage_email_notification BOOLEAN NOT NULL,
    manage_privacy_settings BOOLEAN NOT NULL,
    terms_of_use TEXT NOT NULL,
    hold_subscription BOOLEAN NOT NULL,
    cancel_subscription BOOLEAN NOT NULL,
    devices TEXT NOT NULL,
    referrals TEXT NOT NULL
);

CREATE TABLE cart (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL REFERENCES customer (id) DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE CartItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cart_id INTEGER NOT NULL REFERENCES cart (id) DEFERRABLE INITIALLY DEFERRED,
    product_id INTEGER NOT NULL REFERENCES fruit (id) DEFERRABLE INITIALLY DEFERRED,
    quantity INTEGER NOT NULL DEFAULT 1,
    added_on DATETIME NOT NULL
);
