# Jungle

Jungle is a mini e-commerce application built with Rails 4.2. Jungle allows visitors to view products by category and make purchases as both a registered user or a visitor. Customers can view products in more detail and also leave reviews and ratings for each product. Jungle leverages the Stripe API for secure transactions. Upon a successful order, customers are sent an email receipt with their order details.

## Final Product

!["Products catalog/Home Page"](#)
!["Cart display"](#)
!["Product details with form to write review and provide rating"](#)
!["Admin products panel with ability to add and remove products"](#)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios. Choose any future date as the expiry date and any 3 numbers for CVC.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
