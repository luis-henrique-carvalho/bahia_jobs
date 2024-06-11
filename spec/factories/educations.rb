# == Schema Information
#
# Table name: educations
#
#  id             :uuid             not null, primary key
#  degree         :integer          default("high_school"), not null
#  end_date       :date
#  field_of_study :string
#  school_name    :string
#  start_date     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  resume_id      :uuid             not null
#
# Indexes
#
#  index_educations_on_resume_id  (resume_id)
#
# Foreign Keys
#
#  fk_rails_...  (resume_id => resumes.id)
#
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
