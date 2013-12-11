class AddPositionToFaqs < ActiveRecord::Migration
  def change
    add_column :faqs, :position, :integer
    add_index :faqs, :position
  end
end
