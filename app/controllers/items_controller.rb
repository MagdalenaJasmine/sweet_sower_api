
require 'csv'
class ItemsController < ApplicationController
    def index
        @items = Item.all
        render json: @items, status: :ok
    end

    def read_csv
        # byebug
        temporaryFile = params["file"].tempfile
        table = CSV.foreach(temporaryFile.path, :headers => true, encoding: "UTF-8") do |row| Item.create(row.to_hash) end
    end

    # def destroy
    #     @item = Item.where(id: params[:id]).first
    #     if @item.destroy
    #         head(:ok)
    #     else
    #         head(:unprocessable_entity)
    #     end
    # end


    private
    def item_params
        params.require(:item).permit(:category, :name, :description, :product_type, :price, :date, :allergens, :delivery_date)
    end
end
