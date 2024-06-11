class ResumesController < ApplicationController
  before_action :set_resume, only: %i[show edit update destroy]

  def index
    @resumes = current_user.resumes
  end

  def show; end

  def new
    @resume = current_user.build_resume
    @resume.experiences.build
    @resume.educations.build
    @resume.skills.build
    @resume.languages.build
  end

  def edit; end

  def create
    @resume = current_user.build_resume(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to resume_url(@resume), notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to resume_url(@resume), notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resume.destroy!

    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_resume
    @resume = current_user.resumes.find(params[:id])
  end

  def resume_params
    params.require(:resume).permit(
      :summary,
      experiences_attributes: %i[id company_name position start_date end_date description _destroy],
      educations_attributes: %i[id school_name degree field_of_study start_date end_date _destroy],
      skills_attributes: %i[id name proficiency _destroy],
      languages_attributes: %i[id name proficiency _destroy]
    )
  end
end
