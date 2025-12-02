CREATE DATABASE LibraryDB;

CREATE SCHEMA library;
set search_path to library;
CREATE TABLE library.Books
(
    book_id        SERIAL PRIMARY KEY,
    title          VARCHAR(255) NOT NULL,
    author         VARCHAR(150),
    published_year INTEGER,
    available      BOOLEAN DEFAULT TRUE
);

CREATE TABLE library.Members
(
    member_id SERIAL PRIMARY KEY,
    name      VARCHAR(150)        NOT NULL,
    email     VARCHAR(150) UNIQUE NOT NULL,
    join_date DATE DEFAULT CURRENT_DATE
);