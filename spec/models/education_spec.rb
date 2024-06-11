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
require 'rails_helper'

RSpec.describe Education, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
