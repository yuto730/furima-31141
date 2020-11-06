FactoryBot.define do
  factory :item_transaction do

    postal_code   {"216-0035"}
    prefecture_id {15}
    municipality  {"川崎市宮前区"}
    number        {"馬絹"}
    phone_number  {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}

  end
end