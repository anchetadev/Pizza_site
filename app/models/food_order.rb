class FoodOrder < ActiveRecord::Base
  belongs_to :food
  belongs_to :cart
end
