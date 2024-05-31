class ApplicantSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone
  has_one :user
  has_one :position
end
