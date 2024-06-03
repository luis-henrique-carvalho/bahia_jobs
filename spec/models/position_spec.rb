# == Schema Information
#
# Table name: positions
#
#  id          :uuid             not null, primary key
#  career      :integer          not null
#  city        :string
#  contract    :integer          not null
#  description :text
#  name        :string           not null
#  publish     :boolean          not null
#  remote      :boolean          not null
#  salary_max  :decimal(10, 2)   default(0.0), not null
#  salary_min  :decimal(10, 2)   default(0.0), not null
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
