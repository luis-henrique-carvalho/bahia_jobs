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
class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :career, :contract, :remote, :city, :state, :summary, :description, :publish
  has_one :company
end
