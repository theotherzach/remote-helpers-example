class ItemsController < ApplicationController
  before_action :set_items, only: [:index, :create]

  def index
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save
        format.html { redirect_to :index, notice: 'Item was successfully created.' }
        format.js
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_items
    @items = Item.all.order(:id).limit(50)
  end

  def item_params
    params.require(:item).permit(:name, :description)
  end
end

