class PositionsController < ApplicationController
  before_action :set_position, only: %i[show edit update destroy]
  before_action :set_search, only: %i[index]

  # before_action :authenticate_user!

  # GET /positions or /positions.json
  def index
    @positions = @search.result
    @pagy, @positions = pagy(@positions)
  end

  # GET /positions/1 or /positions/1.json
  def show; end

  # GET /positions/new
  def new
    @position = Position.new
    @position.tags.build
    @existing_tags = Tag.all
  end

  # GET /positions/1/edit
  def edit; end

  # POST /positions or /positions.json
  def create
    @position = Position.new(position_params)

    respond_to do |format|
      if @position.save
        format.html { redirect_to position_url(@position), notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @position }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /positions/1 or /positions/1.json
  def update
    respond_to do |format|
      if @position.update(position_params)
        format.html { redirect_to position_url(@position), notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @position }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /positions/1 or /positions/1.json
  def destroy
    @position.destroy!

    respond_to do |format|
      format.html { redirect_to positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_position
    @position = Position.includes(:tags, :company).find(params[:id])
  end

  def set_search
    @search = Position.includes(:tags, :company).ransack(params[:q])
  end

  # Only allow a list of trusted parameters through.
  def position_params
    params.require(:position).permit(:name, :career, :contract, :remote, :city, :state, :summary, :description,
                                     :publish, :company_id, existing_tag_ids: [], tags_attributes: %i[id name])
  end
end
