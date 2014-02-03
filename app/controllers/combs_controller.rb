class CombsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @combs = @model.combs.order(:quantity)
      render 'index'
    else
      @combs = Comb.search(params[:search])
      render 'search'
    end
  end

  def show
    @line_item = @comb.line_items.new
  end

  def new
    @comb = Comb.new
  end
end
