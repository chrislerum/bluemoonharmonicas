# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_image do
    photo "MyString"
    item_id 1
  end
end
