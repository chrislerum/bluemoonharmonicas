module Admin::ItemHelper
  def current_link?(item)
    @item == item ? 'current' : nil
  end
end
