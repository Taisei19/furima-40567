FactoryBot.define do
  factory :purchase do
    token { "tok_abcdefghijk00000000000000000" }
    post_code { "123-4567" }
    prefecture_id {2}
    city { "MyString" }
    address { "MyString" }
    building { "MyString" }
    phone_number { "08012345678" }
  end
end