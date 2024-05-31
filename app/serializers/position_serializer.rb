class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :career, :contract, :remote, :city, :state, :summary, :description, :publish
  has_one :company
end
