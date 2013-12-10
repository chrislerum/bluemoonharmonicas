class Admin::ItemsController < AdminController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(params[:item])
  end

  def edit
    @categories = Category.roots
    @items = Item.all
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      render nothing: true
    else
      render nothing: true
    end
  end
end
