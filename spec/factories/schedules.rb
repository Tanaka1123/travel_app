FactoryBot.define do
  factory :schedule do
    day {'2023-07-23'}
    time { '10:00' }
    location {'熊本県'}
    description { '詳細' }
  end
end