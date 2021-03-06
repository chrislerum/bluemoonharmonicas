FactoryGirl.define do

  factory :model do
  end

  factory :comb_image do
    photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_harp_image.jpg')))
  end

  factory :user do
    name "Bob"
    email "bob@gmail.com"
    password "foopassword"
    password_confirmation { |u| "#{u.password}" }
  end

  factory :comb do
    sequence(:name) { |n| "Test Item #{n}" }
    description "This is just an items inventory test."
    price 14.95
    quantity 10
    brand
    material_type
    color
  end

  factory :line_item do
    quantity 7
    unit_price 14.85
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
    link "http://google.com"
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

  factory :brand do
    name "Brand 1"
  end

  factory :material_type do
    name "Material Type 1"
  end

  factory :color do
    name "Color 1"
  end
end
