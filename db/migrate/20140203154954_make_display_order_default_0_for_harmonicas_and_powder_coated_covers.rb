class MakeDisplayOrderDefault0ForHarmonicasAndPowderCoatedCovers < ActiveRecord::Migration
  def up
    change_column :harmonica_images, :display_order, :integer, default: 0
    change_column :powder_coated_cover_images, :display_order, :integer, default: 0
  end

  def down
    raise "no going down"
  end
end
