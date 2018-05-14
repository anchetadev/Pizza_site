class PizzasController < ApplicationController
    def index
        render 'index'
    end

    def new
        @cur = User.find(session[:user_id])
        if @cur.admin == false
            return redirect_to '/admin'
        else
            return render 'new'
        end
    end

    def create
        @pizza = Pizza.create(name:params[:name], desc:params[:desc], price:params[:price], img:params[:img])
        redirect_to '/pizzas/new'
    end

    def edit
        @cur = User.find(session[:user_id])
        if @cur.admin == false
            return redirect_to '/admin'
        else
            @pizza = Pizza.find(params[:id])
            return render 'edit'
        end
    end

    def update
        @pizza = Pizza.find(params[:id])
        @pizza.update(name:params[:name],desc:params[:desc],price:params[:price],img:params[:img])
        # if @pizza.save
        #     @pizza.update(desc:params[:desc],price:params[:price],img:params[:img])
        #     if @pizza.save
        #     flash[:notice]=["successfully created"]
        #     return redirect_to "/pizzas/#{params[:id]}"
        #     else
        #     flash[:errors]=["pizza info is invalid"]
        #     return redirect_to "/pizzas/#{params[:id]}/edit"
        #     end
        # else
        #     flash[:errors] =["name is invalid"]
        #     redirect_to "/pizzas/#{params[:id]}/edit"
        # end
        redirect_to "/pizzas/#{params[:id]}/edit"
    end

    def delete
        Pizza.find(params[:id]).delete
        flash[:notice] =['Deleted pizza']
        redirect_to ''
    end
end

