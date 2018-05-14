class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :food_orders
  has_many :pizza_orders
end
