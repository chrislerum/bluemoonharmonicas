class CreateCustomHtmls < ActiveRecord::Migration
  def change
    create_table :custom_htmls do |t|
      t.text :content
      t.integer :display_order

      t.timestamps
    end
  end
end
