class CartsController < ApplicationController

    def index
        carts = Cart.all
        render json: carts, status: :ok
    end

    def show
        cart_id = params[:id].to_i
        cart = Cart.find_by_id(cart_id)
        render json: cart
    end

    def update
        cart = Cart.find_or_create_by(user_id: params[:user_id] )
        
        if (params[:action_type] == "add_item")
            cart.add_item(params[:item_id], params[:quantity])
        elsif (params[:action_type] == "remove_item")
            cart.remove_item(params[:item_id])
        elsif (params[:action_type] == "submit_cart")
            cart.submit_cart(params[:id])
        end

        render json: cart
    end


    private 

    def cart_params
        params.require(:cart).permit(:status, :user_id, :item_id, :total_price, :total_qty, :cart_id )
    end
end
