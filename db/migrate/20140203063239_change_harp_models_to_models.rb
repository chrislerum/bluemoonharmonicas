class ChangeHarpModelsToModels < ActiveRecord::Migration
  def up
    rename_table :harp_models, :models
  end

  def down
    rename_table :models, :harp_models
  end
end
