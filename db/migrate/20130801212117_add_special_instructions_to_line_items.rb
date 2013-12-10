class AddSpecialInstructionsToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :special_instructions, :text
  end
end
