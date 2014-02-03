# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comb do
    name "MyString"
    description "MyText"
    brand_id ""
    model_id ""
    material_type_id ""
    color_id ""
  end
end
