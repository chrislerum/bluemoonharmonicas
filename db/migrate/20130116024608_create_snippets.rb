class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :shortcut
      t.text :text
    end
  end
end
