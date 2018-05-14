class Food < ActiveRecord::Base
    belongs_to :cart
    belongs_to :food_order
    validates :name, :desc, :price, :img, presence: true
    validates_numericality_of :price, :on => :create
    validates :name, :desc, length: {minimum: 5 }
end
