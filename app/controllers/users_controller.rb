class UsersController < ApplicationController
    def index
        
        @users = User.all
        render json: @users, status: :ok
    end

    # def create
    #     @user = User.new(user_params)

    #     @user.save
    #     render json: @item, status: :created
    # end

    private 

end 