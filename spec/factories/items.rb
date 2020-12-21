FactoryBot.define do
  factory :item do
    name         {Faker::Name.initials}
    text         {"ああああ"}
    category_id  {2}
    delivery_id  {2}
    status_id    {2}
    city_id      {2}
    days_id      {2}
    price        {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
