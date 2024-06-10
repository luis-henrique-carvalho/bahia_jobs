class CompanyPolicy < ApplicationPolicy
  def initialize(client_user, record)
    @client_user = client_user
    @record = record
  end

  def edit?
    @client_user.present? && @record.user == @client_user
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def index?
    true
  end
end
