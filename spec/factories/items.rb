FactoryBot.define do
  factory :item do
    name                        { Faker::Lorem.sentence }
    category_id                 { Faker::Number.between(from: 2, to: 10) }
    status_id                   { Faker::Number.between(from: 2, to: 4) }
    release_date                { '2020-04-18' }
    purchase_date               { '2020-10-29' }
    quantity_id                 { Faker::Number.between(from: 0, to: 999) } 
    price                       { Faker::Number.between(from: 0, to: 9_999_999) }
    association :genre
    association :user
  end
end
