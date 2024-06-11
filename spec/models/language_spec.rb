# == Schema Information
#
# Table name: languages
#
#  id          :uuid             not null, primary key
#  name        :string
#  proficiency :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  resume_id   :uuid             not null
#
# Indexes
#
#  index_languages_on_resume_id  (resume_id)
#
# Foreign Keys
#
#  fk_rails_...  (resume_id => resumes.id)
#
require 'rails_helper'

RSpec.describe Language, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
