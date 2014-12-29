class SubKitsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @sub_kits = @model.sub_kits.order(:quantity)
      render 'index'
    else
      redirect_to search_results_path
    end
  end

  def show
    @line_item = @sub_kit.line_items.new
  end

  def new
    @sub_kit = SubKit.new
  end
end
