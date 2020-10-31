FactoryBot.define do
  factory :item do

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end

    name          {"商品名"}
    description   {"商品説明"}
    category_id   {"メンズ"}
    status_id     {"新品・未使用"}
    shipping_id   {"着払い(購入者負担)"}
    prefecture_id {"神奈川県"}
    day_id        {"1~2日で発送"}
    price         {"3000"}

    association :user
  end
end
