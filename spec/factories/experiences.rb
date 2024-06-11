# == Schema Information
#
# Table name: experiences
#
#  id           :uuid             not null, primary key
#  company_name :string
#  description  :text
#  end_date     :date
#  position     :string
#  start_date   :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  resume_id    :uuid             not null
#
# Indexes
#
#  index_experiences_on_resume_id  (resume_id)
#
# Foreign Keys
#
#  fk_rails_...  (resume_id => resumes.id)
#
FactoryBot.define do
  factory :experience do
    company_name { "MyString" }
    position { "MyString" }
    start_date { "2024-06-11" }
    end_date { "2024-06-11" }
    description { "MyText" }
    resume { nil }
  end
end
