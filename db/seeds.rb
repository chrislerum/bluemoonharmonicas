# -*- coding: utf-8 -*-

puts "SEEDS!"

### Default users

User.create(email: 'chris.lerum@gmail.com', name: 'Chris Lerum', password: 'urururyt', password_confirmation: 'urururyt').promote_to_admin
AdminUser.create(:email => 'thalchak@tampabay.rr.com', :password => 'bmh2588uf', :password_confirmation => 'bmh2588uf')

Cart.create
Variant.update_all(quantity: 10)

puts "SEEDS DONE!"
