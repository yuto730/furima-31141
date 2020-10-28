FactoryBot.define do
  factory :user do
    nickname              {"kattyan"}
    email                 {"kkk@gmail.com"}
    password              {"a0a0a0"}
    password_confirmation {password}
    first_name            {"松本"}
    last_name             {"一輝"}
    first_name_kana       {"マツモト"}
    last_name_kana        {"カズキ"}
    birthday              {"19980730"}
  end
end