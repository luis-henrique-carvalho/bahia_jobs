class PositionsApplicantsController < ApplicationController
  before_action :set_position
  def index
    @applicants = @position.applicants
  end

  private

  def set_position
    @position = Position.find(params[:position_id])
  end
end
