FactoryBot.define do
  factory :customer_shippings do
    post_code { '123-4567' }
    shipping_area_id { 2 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { 090-12345678 }
  end
end
