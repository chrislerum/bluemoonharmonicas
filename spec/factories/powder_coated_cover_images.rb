# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :powder_coated_cover_image do
    photo "MyString"
    powder_coated_cover_id 1
    display_order 1
  end
end
