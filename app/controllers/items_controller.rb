class ItemsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @category = Category.find(params[:category_id])
      if @category.children.any?
        @items = @category.children.map(&:items).flatten
      else
        @items = @category.items.order(:quantity)
      end
      render 'index'
    else
      @items = Item.search(params[:search])
      render 'search'
    end
  end

  def show
    @line_item = @item.line_items.new(purchasable: @item)
  end

  def new
    @item = Item.new
  end
end
