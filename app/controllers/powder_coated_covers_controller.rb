class PowderCoatedCoversController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index
  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @powder_coated_covers = @model.powder_coated_covers.order(:quantity)
      render 'index'
    else
      @powder_coated_covers = PowderCoatedCover.search(params[:search])
      render 'search'
    end
  end

  def show
    @line_item = @powder_coated_cover.line_items.new
  end
end
