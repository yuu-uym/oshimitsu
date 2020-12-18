FactoryBot.define do
  factory :genre do
    theme                        { Faker::Lorem.sentence }
    set_amount                   { Faker::Number.between(from: 0, to: 9_999_999) }
    association :user

    after(:build) do |genre|
      genre.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
