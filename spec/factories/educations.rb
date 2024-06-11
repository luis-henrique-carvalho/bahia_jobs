FactoryBot.define do
  factory :education do
    school_name { "MyString" }
    degree { 1 }
    field_of_study { "MyString" }
    start_date { "2024-06-11" }
    end_date { "2024-06-11" }
    resume { nil }
  end
end
