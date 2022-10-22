FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"1a3c5e"}
    password_confirmation {password}
    last_name             {"佐藤"}
    first_name            {"勝"}
    last_name_kana        {"サトウ"}
    first_name_kana       {"マサル"}
    birth_day             {"1993-06-29"}
  end
end
