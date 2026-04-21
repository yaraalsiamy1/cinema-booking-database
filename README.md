# Cinema Ticket Booking System

This project is a database system for managing cinema ticket reservations.

It was developed as part of a Database course project and includes database design, table implementation, sample data insertion, and SQL query testing.

## Project Overview

The system manages:

- Movies
- Screenings
- Customers
- Ticket reservations

It supports storing movie details, screening schedules, customer information, and booked tickets in a structured relational database.

## Database Design

The project includes:

- Entity identification
- ER Diagram
- Relational Schema
- Table creation with primary and foreign keys
- Sample data insertion

## Main Tables

- `Movie`
- `Screening`
- `Customer`
- `Ticket`

## SQL Features Implemented

The project demonstrates several SQL concepts, including:

- Basic `SELECT` queries
- Aggregate functions
- `JOIN` queries
- Subqueries
- View creation

## Example Queries

Some implemented queries include:

- Retrieve movie titles with age rating PG
- Retrieve low-price screenings
- Calculate average ticket price
- Retrieve lowest and highest ticket prices
- Display ticket, customer, and movie information
- Identify customers who purchased the highest-priced screening
- Create a ticket report view (`v_ticket_report`)

## Repository Structure

```text
sql/
└── Cinema DB.sql

docs/
└── Database_Project.pdf
