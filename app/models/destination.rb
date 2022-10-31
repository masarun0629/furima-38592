class Destination < ApplicationRecord
  #validates :code,:city,:address,:phone_number,presence: true
  #validates :prefecture_id,numericality: { other_than: 0 ,message: "can't be blank"} 
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :order
end
