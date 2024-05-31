# == Schema Information
#
# Table name: taggings
#
#  id          :uuid             not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  position_id :uuid             not null
#  tag_id      :uuid             not null
#
# Indexes
#
#  index_taggings_on_position_id  (position_id)
#  index_taggings_on_tag_id       (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (position_id => positions.id)
#  fk_rails_...  (tag_id => tags.id)
#
class Tagging < ApplicationRecord
  belongs_to :position
  belongs_to :tag
end
