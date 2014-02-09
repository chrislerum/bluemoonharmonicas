class SearchController < ApplicationController

  def results
    @combs = Comb.search(params[:search])
    @harmonicas = Harmonica.search(params[:search])
    @powder_coated_covers = PowderCoatedCover.search(params[:search])
    render 'results'
  end
end
