class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :redirect_if_company_present, only: [:new]
  before_action :purge_logo, only: [:update]
  # before_action :authenticate_user!

  # GET /companies or /companies.json

  def index
    @pagy, @companies = pagy(Company.order(updated_at: :desc), items: 5)

    respond_to do |format|
      format.html
      format.json do
        render json: {
          companies: ActiveModelSerializers::SerializableResource.new(@companies, each_serializer: CompanySerializer),
          meta: pagy_metadata(@pagy).slice(:count, :page, :items, :pages, :prev, :next)
        }
      end
    end
  end

  # GET /companies/1 or /companies/1.json
  def show; end

  # GET /companies/new
  def new
    @company = current_user.build_company
  end

  # GET /companies/1/edit
  def edit; end

  # POST /companies or /companies.json
  def create
    @company = current_user.build_company(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to company_url(@company), notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name, :url, :logo, :description, :summary, :founded_date, :employee_count,
                                    :contact_email, :contact_phone)
  end

  def purge_logo
    @company.logo.purge if @company.logo.attached?
  end

  def redirect_if_company_present
    redirect_to edit_company_url(current_user.company) if current_user.company.present?
  end
end
