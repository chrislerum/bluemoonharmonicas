class HarmonicasController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @harmonicas = @model.harmonicas.order(:quantity)
      render 'index'
    else
      @harmonicas = Harmonica.search(params[:search])
      render 'search'
    end
  end

  def show
    @line_item = @harmonica.line_items.new
  end
end
