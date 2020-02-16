FactoryBot.define do
  factory :country do
    name { Faker::Name.name }
    iso2 {"CA"}
  end
end
