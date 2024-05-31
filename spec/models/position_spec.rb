# == Schema Information
#
# Table name: positions
#
#  id          :uuid             not null, primary key
#  career      :integer
#  city        :string
#  contract    :integer
#  description :text
#  name        :string
#  publish     :boolean
#  remote      :boolean
#  state       :string
#  summary     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  company_id  :uuid             not null
#
# Indexes
#
#  index_positions_on_company_id  (company_id)
#
# Foreign Keys
#
#  fk_rails_...  (company_id => companies.id)
#
require 'rails_helper'

RSpec.describe Position, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
