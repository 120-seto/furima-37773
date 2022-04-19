class CustomerShipping
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_area_id, :city, :address, :building_name, :phone_number, :customer, :user_id, :item_id, :token, :price

  with_options presence: true do
    validates :price, presence: true
    validates :token, presence: true
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is invalid. Include hyphen(-)"}
    validates :user_id
    validates :item_id
  end
  

  def save
   customer = Customer.create(item_id: item_id, user_id: user_id)

   Shipping.create(post_code: post_code, shipping_area_id: shipping_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, customer_id: customer.id)
    
  end
end