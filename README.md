# my_contacts Database Project

A relational database for managing personal contacts in South Africa.

## Tables
- `provinces`
- `zip_codes` (natural key)
- `professions` (UNIQUE)
- `statuses`
- `interests`
- `my_contacts`
- `contact_interests` (junction)

## Features
- 9 provinces + 2 cities each
- ZIP code: 4-digit CHECK constraint
- Each contact has >2 interests
- LEFT JOIN query with full profile

## How to Run
1. Create database in pgAdmin
2. Run `my_contacts.sql`
3. View results

## LEFT JOIN Output
Shows profession, postal code, city, province, status, interests, and seeking.