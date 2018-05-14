class UsersController < ApplicationController

    def menu
        @pizza = Pizza.all
        @food = Food.all
        @user = current_user
        if current_user
            if current_user.cart == nil
                Cart.create(user:current_user)
            end
        @piz=current_user.cart.pizza_orders.all
        @fo=current_user.cart.food_orders.all
        return render 'menu'
        end
        render 'menu'
    end
    def pizza_order 
        @order = PizzaOrder.create(cart:current_user.cart, pizza:Pizza.find(params[:id]))
        
        redirect_to '/menu'
    end
    def food_order 
        @order = FoodOrder.create(cart:current_user.cart, food:Food.find(params[:id]))
        redirect_to '/menu'
    end
    def new
        render 'new'
    end
    def create
        @user = User.create(email:params[:email], password:params[:password], password_confirmation:params[:password_confirmation])  
        if @user && @user.password == @user.password_confirmation
          session[:user_id] = @user.id   
          return redirect_to '/'
        end
        flash[:errors] = ["can't be blank text"]
        return redirect_to '/log_in'
    end
    def remove_pizza
        current_user.cart.pizza_orders.find(params[:id]).destroy
        redirect_to '/menu'
    end
    def remove_food
        current_user.cart.food_orders.find(params[:id]).destroy
        redirect_to '/menu'
    end
    def checkout
        if current_user
        @piz=current_user.cart.pizza_orders.all
        @fo=current_user.cart.food_orders.all
        @total = 0
        @piz.each do |p|
            @total += p.pizza.price
        end
        @fo.each do |p|
            @total += p.food.price
        end
        return render 'checkout'
        end 

        render 'checkout'
    end
    
    def admin
        render 'adminLog'
    end
    def admin_create
        @user = User.find_by_email(params[:admin_email])
        if @user && @user.authenticate(params[:admin_password]) && @user.admin == true
          session[:user_id] = @user.id   
          return redirect_to "/admin/orders"
        else
          flash[:errors] = ["Invalid Combination"]
          return redirect_to '/admin'
        end
    end
    def admin_orders
        @user = User.all
        @cur = User.find(session[:user_id])
        if @cur.admin == false
            return redirect_to '/admin'
        else
            return render 'orders'
        end
    end
    def finish
        @cart = Cart.find(params[:id]).destroy
        redirect_to '/menu'
    end


end
