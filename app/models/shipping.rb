class Shipping < ApplicationRecord
  belongs_to :customer
  belongs_to :shipping_cost
end