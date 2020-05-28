class ItemsController < ApplicationController
  before_action :set_items, only: :index

  def index
    @item = Item.new
  end

  private

  def set_items
    @items = Item.order(:id).limit(50)
  end
end

