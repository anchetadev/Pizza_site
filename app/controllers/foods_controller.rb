class FoodsController < ApplicationController
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
        puts"HEEEEEEEEEEEEEEREEEEEEEEEEEEE"
        Food.create(name:params[:name], desc:params[:desc], price:params[:price], img:params[:img])
        redirect_to '/foods/new'
    end

    def edit
        @cur = User.find(session[:user_id])
        if @cur.admin == false
            return redirect_to '/admin'
        else
            @food = Food.find(params[:id])
            return render 'edit'
        end
    end

    def update
        @food = Food.find(params[:id])
        @food.update(name:params[:name],desc:params[:desc],price:params[:price],img:params[:img])
        # if @food.save
        #     @food.update(desc:params[:desc],price:params[:price],img:params[:img])
        #     if @food.save
        #     flash[:notice]=["successfully created"]
        #     return redirect_to "/foods/#{params[:id]}"
        #     else
        #     flash[:errors]=["food info is invalid"]
        #     return redirect_to "/foods/#{params[:id]}/edit"
        #     end
        # else
        #     flash[:errors] =["name is invalid"]
        #     redirect_to "/foods/#{params[:id]}/edit"
        # end
        redirect_to "/foods/#{params[:id]}/edit"
    end

    def delete
        Food.find(params[:id]).delete
        flash[:notice] =['Deleted food']
        redirect_to ''
    end
end

