class Admin::InventoryController < AdminController
  def index
    @variants = Option.to_table
  end
end
