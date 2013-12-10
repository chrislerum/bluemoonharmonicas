# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :snippet do
    shortcut Faker::Lorem.word
    text "This is just a snippet. If there's markdown in here, so be it."
  end
end
