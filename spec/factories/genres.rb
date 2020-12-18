FactoryBot.define do
  factory :genre do
    theme                        { Faker::Lorem.sentence }
    set_amount                   { Faker::Number.between(from: 0, to: 9_999_999) }
    
    association :user
  end
end
