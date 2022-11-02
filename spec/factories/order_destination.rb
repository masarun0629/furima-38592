FactoryBot.define do
  factory :order_destination do
    token         {"tok_abcdefghijk00000000000000000"}
    code          {"950-0123"}
    prefecture_id {1}
    city          {"新潟市"}
    address       {"江南区亀田1-2-48"}
    building      {"1-2-48"}
    phone_number  {"08058642424"}
  end
end