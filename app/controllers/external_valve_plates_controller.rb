class ExternalValvePlatesController < ApplicationController
  load_and_authorize_resource
  skip_load_and_authorize_resource only: :index

  def index
    if params[:search].blank?
      @model = Model.find(params[:model_id])
      @external_valve_plates = @model.external_valve_plates.order(:quantity)
      render 'index'
    else
      redirect_to search_results_path
    end
  end

  def show
    @line_item = @external_valve_plate.line_items.new
  end

  def new
    @external_valve_plate = ExternalValvePlate.new
  end
end
