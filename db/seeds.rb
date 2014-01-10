# -*- coding: utf-8 -*-

### Combs

puts "SEEDS!"

names = [["Wood Hohner Marine Band Harmonica Combs", "Wood Hohner Special 20 Harmonica Combs", "Wood Hohner Golden Melody Harmonica Combs", "Wood Hohner MS-Series Harmonica Combs", "Wood Suzuki (Manji, ProMaster) Harmonica Combs", "Wood Suzuki SUB-30 – BMH30 Harmonica Combs", ],  [ "Acrylic Hohner Marine Band Harmonica Combs", "Acrylic Hohner Special 20 Harmonica Combs", "Acrylic Hohner Golden Melody Harmonica Combs", "Acrylic Hohner MS-Series Harmonica Combs", "Acrylic Suzuki (Manji, ProMaster) Harmonica Combs", "Acrylic Suzuki SUB-30 – BMH30 Harmonica Combs", ],  [ "Aluminum Hohner Marine Band Harmonica Combs", "Aluminum Hohner Special 20 Harmonica Combs", "Aluminum Hohner Golden Melody Harmonica Combs", "Aluminum Hohner MS-Series Harmonica Combs", "Aluminum Suzuki (Manji, ProMaster) Harmonica Combs", "Aluminum Suzuki SUB-30 – BMH30 Harmonica Combs", ],  [ "Solid Surface Hohner Marine Band Harmonica Combs", "Solid Surface Hohner Special 20 Harmonica Combs", "Solid Surface Hohner Golden Melody Harmonica Combs", "Solid Surface Hohner MS-Series Harmonica Combs", "Solid Surface Suzuki (Manji, ProMaster) Harmonica Combs", "Solid Surface Suzuki SUB-30 – BMH30 Harmonica Combs", ],  [ "Fancy Acrylic Hohner Marine Band Harmonica Combs", "Fancy Acrylic Hohner Special 20 Harmonica Combs", "Fancy Acrylic Hohner Golden Melody Harmonica Combs", "Fancy Acrylic Hohner MS-Series Harmonica Combs", "Fancy Acrylic Suzuki (Manji, ProMaster) Harmonica Combs", "Fancy Acrylic Suzuki SUB-30 – BMH30 Harmonica Combs", ],  [ "Kirinite Hohner Marine Band Harmonica Combs", "Kirinite Hohner Special 20 Harmonica Combs", "Kirinite Hohner Golden Melody Harmonica Combs", "Kirinite Hohner MS-Series Harmonica Combs", "Kirinite Suzuki (Manji, ProMaster) Harmonica Combs", "Kirinite Suzuki SUB-30 – BMH30 Harmonica Combs"],  [ "Brass Hohner Marine Band Harmonica Combs", "Brass Hohner Special 20 Harmonica Combs", "Brass Hohner Golden Melody Harmonica Combs", "Brass Hohner MS-Series Harmonica Combs", "Brass Suzuki (Manji, ProMaster) Harmonica Combs", "Brass Suzuki SUB-30 – BMH30 Harmonica Combs"]]
prices = [24.95, 19.95, 28.95, 25.95, 29.95, 29.95, 42.95]
combs_sub_categories = %w[Wood Acrylic Aluminum Solid\ Surface Fancy\ Acrylic Kirinite Brass]

combs_category = Category.create(name: 'Combs')
names.each_with_index do |category, index|
  combs_category.children.create(name: combs_sub_categories[index])
  category.each_with_index do |sub_category, sub_index|
    Category.last.items.create(name: sub_category, shortname: "", price: prices[index], description: 'Dummy description')
  end
end

# Wood material option
wood_material = Option.create(title: 'material', sentence: 'Choose a *material*.')
%w[Maple Cherry Jatoba].each do |v|
  wood_material.values.create(title: v, price_diff:0)
end
wood_material.items << Category.find_by_name('Wood').items

# Acrylic color option
acrylic_color = Option.create(title: 'acrylic color', sentence: 'Choose a *color*.')
"Crystal Clear
Fluorescent Red
Tranluscent White
Translucent Black
Translucent Blue
Translucent Green
Translucent Orange
Translucent Red
Translucent Violet (Purple)
Translucent White
Translucent Yellow
Transparent Amber
Transparent Blue
Transparent Green
Transparent Grey
Transparent Red
Transparent Yellow".split("\n").each do |v|
  acrylic_color.values.create(title: v, price_diff: 0)
end
acrylic_color.items << Category.find_by_name('Acrylic').items

## Corian color option
solid_surface_color = Option.create(title: 'Solid Surface color', sentence: 'Choose a *color*.')
"Black (Dupont™ Corian®)
Blue (Hi Macs Midnight Pearl)
White (Dupont™ Corian® Pebble Beach)
Green (Dupont™ Corian® Malachite)
Red (Staron Sanded Pine)
Beige (Dupont™ Corian® Oyster)".split("\n").each do |v|
  solid_surface_color.values.create(title: v, price_diff: 0)
end
solid_surface_color.items << Category.find_by_name('Solid Surface').items

## Aluminum color option
aluminum_color = Option.create(title: 'aluminum color', sentence: 'Choose a *color*.')
"Black
Blue
Anodized Clear".split("\n").each do |v|
  aluminum_color.values.create(title: v, price_diff: 0)
end
aluminum_color.items << Category.find_by_name('Aluminum').items

## Brass color option
brass_color = Option.create(title: 'brass color', sentence: 'Choose a *color*.')
brass_color.values.create(title: "Brass", price_diff: 0)
brass_color.items << Category.find_by_name('Brass').items

## Fancy Acrylic color option
fancy_acrylic_color = Option.create(title: 'fancy acrylic color', sentence: 'Choose a *color*.')
fancy_acrylic_color.values.create(title: "Fancy Acrylic", price_diff:0)
fancy_acrylic_color.items << Category.find_by_name('Fancy Acrylic').items

## Kirinite color option
kirinite_color = Option.create(title: 'kirinite color', sentence: 'Choose a *color*.')
kirinite_color.values.create(title: "Kirinite", price_diff:0)
kirinite_color.items << Category.find_by_name('Kirinite').items

### Cover Plates

names = ["Cover Plates for Hohner Marine Band 1896 Harmonicas", "Cover Plates for Hohner Special 20 Harmonicas", "Cover Plates for Hohner Golden Melody Harmonicas", "Cover Plates for Hohner MS-Series Harmonicas", "Cover Plates for Suzuki HarpMaster 10-Hole Diatonic Harmonicas"]
shortnames = ["MB1896 Cover Plates", "SP20 Cover Plates", "Golden Melody Cover Plates", "MS-Series Cover Plates", "HarpMaster 10-Hole Diatonic Cover Plates"]
Category.create(name:'Cover Plates')
names.length.times do |t|
  Category.find_by_name('Cover Plates').items.create(name: names[t], shortname: shortnames[t], price: 21.95, description: 'BLANK')
end

# Cover plate color option
cover_plate_color = Option.create(title: 'cover plate color', sentence: 'Choose a *color*.')
"Candy Blue
Candy Red
Gloss Black
Gloss White
Gold
Green
Moon Stone
Purple".split("\n").uniq.each do |v|
  cover_plate_color.values.create(title: v, price_diff:0)
end
cover_plate_color.items << Category.find_by_name('Cover Plates').items


### Reed Plates

names = ["Reed Plates for Hohner Marine Band 1896 Harmonicas", "Reed Plates for Hohner Special 20 Harmonicas", "Reed Plates for Hohner Golden Melody Harmonicas", "Reed Plates for Hohner MS-Series Harmonicas", "Reed Plates for Suzuki HarpMaster 10-Hole Diatonic Harmonicas"]
shortnames = ["MB1896 Reed Plates", "SP20 Reed Plates", "Golden Melody Reed Plates", "MS-Series Reed Plates", "HarpMaster Reed Plates"]
Category.create(name:'Reed Plates')
names.length.times do |t|
  Category.find_by_name('Reed Plates').items.create(name: names[t], shortname: shortnames[t], price: 21.95, description: 'BLANK')
end

# Reed plate key option
reed_plate_key = Option.create(title: 'key', sentence: 'Choose a *key*.')
%w[C G D A E B G♭/F♯ D♭ A♭ E♭ B♭ F Low\ F].each do |v|
  reed_plate_key.values.create(title: v, price_diff:0)
end
reed_plate_key.items << Category.find_by_name('Reed Plates').items

### Categories

Category.create(name: "Vintage Pre-War Harmonicas")
complete = Category.create(name: "Complete Harps")
Category.create(name: "Suzuki SUB-30 Customization Kits")
Category.create(name: "Harmonica Skinz")

### Complete harps

[["Hohner Golden Melody", 45.95],
["Hohner Marine Band 1896 Classic", 45.95],
["Hohner Marine Band Crossover", 84.95],
["Hohner Special 20", 45.95],
["Low Tuned Hohner MS Cross Harp", 88.90],
["Pre-War Marine Band 1896", 74.95],
["Suzuki Manji", 0],
["Suzuki SUB-30", 149.95]].each do |item|
  i = Item.create(name: item[0], price: item[0], description: "Dummy description")
  i.categories << complete
end

### Default users

User.create(email: 'chris.lerum@gmail.com', name: 'Chris Lerum', password: 'urururyt', password_confirmation: 'urururyt').promote_to_admin
#AdminUser.create(:email => 'thalchak@tampabay.rr.com', :password => 'bmh2588uf', :password_confirmation => 'bmh2588uf')

Cart.create
Variant.update_all(quantity: 10)

puts "SEEDS DONE!"
