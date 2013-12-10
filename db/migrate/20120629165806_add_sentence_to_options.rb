class AddSentenceToOptions < ActiveRecord::Migration
  def change
    add_column :options, :sentence, :string
  end
end
