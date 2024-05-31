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
class Position < ApplicationRecord
  belongs_to :company

  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :tags

  scope :with_tags, lambda { |tag_names|
    joins(:tags).where(tags: { name: tag_names }).distinct
  }

  attr_accessor :existing_tag_ids

  after_save :assign_existing_tags

  private

  def assign_existing_tags
    return unless existing_tag_ids.present?

    tags << Tag.where(id: existing_tag_ids)
  end
end
