class Item < ApplicationRecord
  validates :image,presence: true
  validates :name,presence: true,length: {maximum: 40}
  validates :explanation,presence: true,length: {maximum: 4000}
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
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
