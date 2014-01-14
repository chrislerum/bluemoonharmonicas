FactoryGirl.define do

  factory :harp_model do
  end

  factory :item_image do
    photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_harp_image.jpg')))
  end

  factory :user do
    name "Bob"
    email "bob@gmail.com"
    password "foopassword"
    password_confirmation { |u| "#{u.password}" }
    admin false

    factory :admin do
      admin true
    end
  end

  factory :item do
    sequence(:name) { |n| "Test Item #{n}" }
    sequence(:shortname) { |n| "TI#{n}" }
    price 14.95
    description "This is just an items inventory test."
    manages_inventory false
    quantity 10
  end

  factory :option do
    title 'Test Option'
    sentence 'Choose a material'
  end

  factory :option_value do
    title 'Test Value'
    price_diff 0.0
  end

  factory :variant do
    item
    option_value
  end

  factory :line_item do
    quantity 1
    unit_price 14.95
  end

  factory :order do
    express_payer_id 1231231234
    express_token SecureRandom.base64
    ip_address '127.0.0.1'

    first_name "Bob"
    last_name "Jenkins"
    email "Bob@gmail.com"
    address "111 Hello St."
  end

  factory :order_transaction do
    order
    success true
    authorization 'bogus'
    message '200'
    params '{lol: "yes"}'
  end

  factory :link do
    title "Test Link"
    link "http://stevenpetryk.com"
    description "The best guy I know."
  end
  factory :faq do
    question "Example Question"
    answer "Example answer"
  end

  factory :snippet do
    shortcut "hello"
    text "This is just a snippet. If there's markdown in here, so be it."
  end
end
