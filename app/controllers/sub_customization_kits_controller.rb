class SubCustomizationKitsController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @kit = @model.sub_customization_kits.order(:quantity)
      render 'index'
    else
      redirect_to search_results_path
    end
  end

  def show
    @line_item = @kit.line_items.new
  end

  def new
    @kit = SubCustomizationKit.new
  end
end
