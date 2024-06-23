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
  end
end