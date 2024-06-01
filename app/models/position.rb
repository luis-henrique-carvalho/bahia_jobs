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

  enum career: {
    developer: 0,
    designer: 1,
    marketing: 2,
    sales: 3,
    support: 4,
    management: 5,
    finance: 6,
    hr: 7,
    other: 8
  }

  enum contract: {
    clt: 0,
    pj: 1,
    frelancer: 2
  }

  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :tags

  scope :with_tags, lambda { |tag_names|
    joins(:tags).where(tags: { name: tag_names }).distinct
  }

  attr_accessor :existing_tag_ids

  after_save :assign_existing_tags

  def self.ransackable_attributes(_auth_object = nil)
    %w[name career contract remote city state summary description publish company_id]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[company tags]
  end

  private

  def assign_existing_tags
    return unless existing_tag_ids.present?

    current_tag_ids = tags.pluck(:id)

    tags_to_remove_ids = current_tag_ids - existing_tag_ids

    taggings.where(tag_id: tags_to_remove_ids).destroy_all

    tags_to_add = Tag.where(id: existing_tag_ids - current_tag_ids)
    tags << tags_to_add
  end
end
