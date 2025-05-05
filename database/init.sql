-- Create database if not exists
SELECT 'CREATE DATABASE helloworld'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'helloworld');

-- Connect to the database
\c helloworld;

-- Create extension for UUID if not exists
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create users table (this will be managed by GORM, but here's the SQL equivalent)
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE,
    deleted_at TIMESTAMP WITH TIME ZONE,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    last_login TIMESTAMP WITH TIME ZONE
); 