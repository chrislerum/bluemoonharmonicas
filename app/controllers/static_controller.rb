class StaticController < ApplicationController
  def home
    @top_bit = CustomHtml.find_by_display_order(1)
    @bottom_bit = CustomHtml.find_by_display_order(2)
  end

  def about
  end

  def newsletter
  end
end
