class OrderDestination
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:code,:prefecture,:city,:address,:building,:phone_number
  with_options presence: true do
  validates :user_id,:item_id,:code,:city,:address,:phone_number
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Destination.create(code: code, prefecture: prefecture, city: city, address: address, building: building, phone_number: phone_number,order_id: order.id)
  end
end