FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    name          {"商品名"}
    description   {"商品説明"}
    category_id   {2}
    status_id     {2}
    shipping_id   {2}
    prefecture_id {2}
    day_id        {2}
    price         {3000}

    association :user
  end
end
