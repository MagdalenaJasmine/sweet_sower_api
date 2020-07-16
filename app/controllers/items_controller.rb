class ItemsController < ApplicationController
    def index
        byebug
        @items = Item.all
        render json: @items, status: :ok
    end

    # def create
    #     @item = Item.new(item_params)

    #     @item.save
    #     render json: @item, status: :created
    # end

    # def destroy
    #     @item = Item.where(id: params[:id]).first
    #     if @item.destroy
    #         head(:ok)
    #     else
    #         head(:unprocessable_entity)
    #     end
    # end


    # private
    # def item_params
    #     params.require(:item).permit(:name, :description, :type, :price, :date)
    # end
end
