# == Schema Information
#
# Table name: companies
#
#  id             :uuid             not null, primary key
#  contact_email  :string
#  contact_phone  :string
#  description    :text
#  employee_count :integer
#  founded_date   :date
#  name           :string
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :uuid             not null
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
