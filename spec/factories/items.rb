FactoryBot.define do
  factory :item do
    
    name           {"無職"}
    explanation    {"無職です"}
    category_id    {1}
    situation_id   {1}
    load_id        {1}
    prefecture_id  {1}
    shipping_day_id{1}
    price          {300}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/LGTM.jpeg'), filename: 'LGTM.jpeg')
    end
  end
end
