class Admin::PhotosController < AdminController
  def sort
    params[:photo].each_with_index do |id, index|
      Photo.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  def new
    @item =  Item.find(params[:item_id])
    @photo = @item.photos.new
  end

  def create
    @item = Item.find(params[:item_id])
    @photo = @item.photos.create(params[:photo])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end
end
