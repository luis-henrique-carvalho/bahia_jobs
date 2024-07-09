# == Schema Information
#
# Table name: applicants
#
#  id          :uuid             not null, primary key
#  email       :string
#  name        :string
#  phone       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position_id :uuid             not null
#  user_id     :uuid             not null
#
# Indexes
#
#  index_applicants_on_position_id              (position_id)
#  index_applicants_on_user_id                  (user_id)
#  index_applicants_on_user_id_and_position_id  (user_id,position_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#  fk_rails_...  (user_id => users.id)
#
class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position

  validates :user_id, uniqueness: { scope: :position_id, message: 'já se candidatou a esta vaga' }
end
