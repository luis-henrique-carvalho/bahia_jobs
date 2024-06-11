# == Schema Information
#
# Table name: resumes
#
#  id         :uuid             not null, primary key
#  summary    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_resumes_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Resume < ApplicationRecord
  belongs_to :user
  has_many :experiences
  has_many :educations
  has_many :skills
  has_many :languages

  accepts_nested_attributes_for :experiences, :educations, :skills, :languages, allow_destroy: true
end
