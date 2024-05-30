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
#  index_applicants_on_position_id  (position_id)
#  index_applicants_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ApplicantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
