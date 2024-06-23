FactoryBot.define do
  factory :item do
    name              { 'テスト商品' }
    explanation       { 'これはテスト商品です' }
    category_id       { 2 }
    state_id          { 2 }
    payer_id          { 2 }
    prefecture_id     { 2 }
    period_id         { 2 }
    price             { 3000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/test_image.png'), filename: 'test_image.png')
    end  
  end
end