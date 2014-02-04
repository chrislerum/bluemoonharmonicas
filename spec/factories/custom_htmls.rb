# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_html do
    content "MyText"
    display_order 1
  end
end
