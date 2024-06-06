# == Schema Information
#
# Table name: companies
#
#  id             :uuid             not null, primary key
#  contact_email  :string
#  contact_phone  :string
#  employee_count :integer
#  founded_date   :date
#  name           :string
#  summary        :text
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
class Company < ApplicationRecord
  belongs_to :user
  has_one_attached :logo, dependent: :destroy

  validates :name, :summary, :founded_date, :employee_count, presence: true
  validates :contact_email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :positions, dependent: :destroy
end
