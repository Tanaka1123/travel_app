FactoryBot.define do
  factory :bookmark do
    destination {'test'}
    departure_date {'2023-07-23'}
    return_date {'2023-07-26'}
    members { 3 }
    name {'test'}
  end
end