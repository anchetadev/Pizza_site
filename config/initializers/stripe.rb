require 'stripe'
Rails.configuration.stripe = {
  :publishable_key => 'pk_test_xi5jgJq8Nc4369lW7eJW3Z0X',
  :secret_key      => 'sk_test_W9nSzHMr9TAHax7BjSb61kbd'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]