class UsersController < ApplicationController
    def index
        
        @users = User.all
        render json: @users, status: :ok
    end

    def create 
        @user = User.new(user_params)
        # byebug

        if @user.save
            render :create
        else 
            puts @user.errors
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :household_size, :address, :current_order  )
    end

end 