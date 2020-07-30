class SessionsController < ApplicationController
    
    def show
        # byebug
        # current_user ? head(:ok) : head(:unauthorized)
       token = request.headers['Authorization']
        user= User.find_by(authentication_token: token)

        if user 
            render json: {email: user.email, admin: user.admin}
        else
            render json: {error: 'Could not find this user'}, status: 401
        end
    end
    
    def create
        
        user = User.where(email: params[:email]).first
        
        if user&.valid_password?(params[:password])
            render json: user.as_json(only: [:email, :authentication_token]), status: :created
        else 
            render json: {error: 'Unauthorized user'}, status: 401
        end

    end

    def destroy
        current_user&.authentication_token = nil
        if current_user&.save
            head(:ok)
        else
            head(:unauthorized)
            
        end

    end
end