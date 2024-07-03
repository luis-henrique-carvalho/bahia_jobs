class CompaniesPositionsController < ApplicationController
  before_action :set_company, only: [:index]

  def index
    @positions = @company.positions.order(created_at: :desc)
    @pagy, @positions = pagy(@positions)
  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
end
