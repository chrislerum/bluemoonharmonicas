class SearchController < ApplicationController

  def results
    @combs = Comb.search(params[:search])
    render 'search'
  end
end
