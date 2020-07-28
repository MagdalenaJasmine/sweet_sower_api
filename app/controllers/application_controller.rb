class ApplicationController < ActionController::API
    acts_as_token_authentication_handler_for User, fallback: :none

    def current_site_user
        user_id = decoded_token[0]["user_id"]
        user = User.find(user_id)
    end
end
