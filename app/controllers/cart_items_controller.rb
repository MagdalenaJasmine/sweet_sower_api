class CartItemsController < ApplicationController

    def index
        
        @cartItem = CartItem.all
        render json: @cartItems, status: :ok
    end

    def create
        cart = Cart.find(cart_item_params[:cart_id])
        cart_items = cart.cart_items

        found_item = cart_items.detect do |item|
            cart_item_params[:item_id] == item.item_id
        end

        if found_item
            # found_item.quantity += 1
            found_item.quantity += cart_item_params[:quantity].to_i
            found_item.item_price = found_item.quantity * found_item.item.price_in_cents
            found_item.save
        else
            cartItem = CartItem.create(cart_item_params)
            cartItem.item_price = cartItem.quantity * cartItem.product.price_in_cents
            cartItem.save
        end

        total = 0 
        total_quantity = 0 

        cart = Cart.find(cart_item_params[:cart_id])
        cart.cart_items.each { |item| total += item.item_price }
        cart.total_price = total

        cart.cart_items.each { |item| total_quantity += item.quantity }
        cart.total_qty = total_quantity
        cart.save
        
        # byebug
        render json: order, include: "**"
        # render json: current_site_user, include: '**'


        

    end
    #     @cartItem = CartItem.new(cartItem_params)
    #     if @cartItem.save
    #         render  render json: @cartItems, status: :ok
    #     else 
    #         puts @cartItem.errors
    #     end
    # end

    
    def destroy
        cart_item = CartItem.find(params[:id].to_i)
        cart_item.destroy
        cart = Cart.find(current_site_user.current_order)
        total = 0
        cart.cart_items.each { |item| total += item.item_price }
        cart.total_price = total

        

        order.save
        # render json: {user: current_site_user, order: order}
        render json: current_site_user, include: '**'

    end


    private 

    def cartItem_params
        params.require(:cartItem).permit(:cart_id, :item_id, :quantity, :item_price )
    end
end
