class CombsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @combs = @model.combs.order(:quantity)
      render 'index'
    else
      redirect_to search_results_path
    end
  end

  def show
    @line_item = @comb.line_items.new
  end

  def new
    @comb = Comb.new
  end
end
