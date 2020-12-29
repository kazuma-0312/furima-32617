FactoryBot.define do
  factory :home_buy do
    address    { '111-2222' }
    city_id  { 2 }
    municipality   { 'オレ市オレ区' }
    street        { '1番地1丁目' }
    building  { 'ハウス101' }
    number      { '12312312312' }
    user_id        { 1 }
    item_id        { 1 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end