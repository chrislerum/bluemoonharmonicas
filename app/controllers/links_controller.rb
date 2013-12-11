class LinksController < ApplicationController
  def index
    @links = Link.all(order: :position)
  end

  def sort
    if admin?
      params[:links].each_with_index do |id, index|
        Link.update_all(['position=?', index+1], ['id=?', id])
      end

      render nothing: true
    else
      render status: 403
    end
  end
end
