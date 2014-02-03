class ItemsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @items = @model.items.order(:quantity)
      render 'index'
    else
      @items = Item.search(params[:search])
      render 'search'
    end
  end

  def show
    @line_item = @item.line_items.new
  end

  def new
    @item = Item.new
  end
end
