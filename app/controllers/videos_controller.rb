class VideosController < ApplicationController
  def index
    @videos = Video.where(display: true)
  end
end
