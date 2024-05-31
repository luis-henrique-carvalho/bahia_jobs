# == Schema Information
#
# Table name: companies
#
#  id         :uuid             not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :uuid             not null
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :url
  has_one :user
end
