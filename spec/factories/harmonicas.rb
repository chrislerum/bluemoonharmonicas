# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :harmonica do
    name "MyString"
    description "MyText"
    brand_id 1
    model_id 1
    key_id 1
  end
end
