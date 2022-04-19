FactoryBot.define do
  factory :customer_shipping do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    association :user
    association :item
  end
end
