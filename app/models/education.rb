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
class Education < ApplicationRecord
  belongs_to :resume

  enum degree: {
    high_school: 0,
    tecnical_school: 1,
    bachelors_degree: 3,
    masters_degree: 4,
    doctorate: 5
  }
end
