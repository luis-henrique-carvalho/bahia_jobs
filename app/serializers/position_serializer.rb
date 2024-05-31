class PositionSerializer < ActiveModel::Serializer
  attributes :id, :name, :summary, :description, :city, :state,
             :remote, :publish, :career, :contract, :created_at, :updated_at, :company_id

  belongs_to :company
end
