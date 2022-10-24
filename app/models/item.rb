class Item < ApplicationRecord
  validates :name,:explanation,:price,presence: true
  validates :category_id,:load_id,:prefecture_id,:shipping_day_id,:situation_id, numericality: { other_than: 0 ,message: "can't be blank"} 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :load
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :situation
  belongs_to :user
  has_one_attached :image
end
