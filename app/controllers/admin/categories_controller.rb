class Admin::CategoriesController < ApplicationController
  def sort
    params[:category].each_with_index do |(id, parent_id), index|
      parent_id = nil if parent_id == "null"
      Category.find(id).update_attributes(position: index+1, parent_id: parent_id)
    end
    render nothing: true
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(params[:category])
  end

  def destroy
    @category = Category.find(params[:id]).destroy
  end
end
