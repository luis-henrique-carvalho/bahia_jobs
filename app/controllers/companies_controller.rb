class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]
  before_action :redirect_if_company_present, only: [:new]
  before_action :purge_logo, only: [:update]
  before_action :authenticate_user!
  before_action :authorize_company, only: %i[edit update destroy]

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

  def show; end

  def new
    @company = current_user.build_company
  end

  def edit; end

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

  def destroy
    @company.destroy!

    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def authorize_company
    authorize @company, policy_class: CompanyPolicy
  end

  def set_company
    @company = Company.find(params[:id])
  end

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
