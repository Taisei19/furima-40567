FactoryBot.define do
  factory :buyer do
    post_code { "MyString" }
    prefecture_id { 1 }
    city { "MyString" }
    address { "MyString" }
    building { "MyString" }
    phone_number { "MyString" }
    record { nil }
  end
end
