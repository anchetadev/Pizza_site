class ChargesController < ApplicationController
    def new
    end
    
    def create
      # Amount in cents
      @piz=current_user.cart.pizza_orders.all
      @fo=current_user.cart.food_orders.all
      @total = 0
      @piz.each do |p|
          @total += p.pizza.price
      end
      @fo.each do |p|
          @total += p.food.price
      end
      @amount = @total*100
    
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
    
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to '/checkout'
    end
end
