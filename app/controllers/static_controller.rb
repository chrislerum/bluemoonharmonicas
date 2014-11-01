class StaticController < ApplicationController
  def home
    @home_page_html = CustomHtml.find_by_display_order(1)
  end

  def about
  end

  def newsletter
  end
end
