FactoryBot.define do
  factory :user do
    nickname              {'Taro'}
    email                 { Faker::Internet.email }
    password              {'123456a'}
    password_confirmation {password}
    familyname_kanji      {'山田'}
    firstname_kanji       {'太郎'}
    familyname_kana       {'ヤマダ'}
    firstname_kana        {'タロウ'}
    birthday              {"2000-01-01"}
  end
end