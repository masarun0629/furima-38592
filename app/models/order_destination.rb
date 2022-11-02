class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:code,:prefecture_id,:city,:address,:building,:phone_number,:token
  with_options presence: true do
  validates :user_id,:item_id,:city,:address,:token
  end
  validates :code,presence: true, format: { with: /\A\d{3}[-]\d{4}\z/,allow_blank: true}
  validates :phone_number,presence: true, format: { with: /\A\d{10,11}\z/,allow_blank: true}
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(code: code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number,order_id: order.id)
  end
end