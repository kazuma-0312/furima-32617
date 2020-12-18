FactoryBot.define do
  factory :user do
    nickname              { "furima" }
    email                 { "aaa@test" }
    password              {"abc123"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"不利魔"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"フリマ"}
    birthday              {"1999-01-01"}
  end
end