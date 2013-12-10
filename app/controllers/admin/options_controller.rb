class Admin::OptionsController < AdminController
  def index
    @options = Option.all
  end

  def edit
    @options = Option.all
    @option = Option.find(params[:id])
  end

  def update
    @option = Option.find(params[:id])
    @option.update_attributes(params[:option])
  end
end
