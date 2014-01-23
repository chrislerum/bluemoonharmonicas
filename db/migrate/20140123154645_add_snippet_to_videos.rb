class AddSnippetToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :snippet, :text
  end
end
