class Item < ApplicationRecord
  belongs_to :user
  has_one :customer
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_area_id, presence: true
  validates :shipping_day_id, presence: true
  validates :price, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_cost
  belongs_to :shipping_area
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_area_id
 end
end