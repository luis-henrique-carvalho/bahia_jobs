require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/resumes", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Resume. As you add validations to Resume, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Resume.create! valid_attributes
      get resumes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      resume = Resume.create! valid_attributes
      get resume_url(resume)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_resume_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      resume = Resume.create! valid_attributes
      get edit_resume_url(resume)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Resume" do
        expect {
          post resumes_url, params: { resume: valid_attributes }
        }.to change(Resume, :count).by(1)
      end

      it "redirects to the created resume" do
        post resumes_url, params: { resume: valid_attributes }
        expect(response).to redirect_to(resume_url(Resume.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Resume" do
        expect {
          post resumes_url, params: { resume: invalid_attributes }
        }.to change(Resume, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post resumes_url, params: { resume: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested resume" do
        resume = Resume.create! valid_attributes
        patch resume_url(resume), params: { resume: new_attributes }
        resume.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the resume" do
        resume = Resume.create! valid_attributes
        patch resume_url(resume), params: { resume: new_attributes }
        resume.reload
        expect(response).to redirect_to(resume_url(resume))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        resume = Resume.create! valid_attributes
        patch resume_url(resume), params: { resume: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested resume" do
      resume = Resume.create! valid_attributes
      expect {
        delete resume_url(resume)
      }.to change(Resume, :count).by(-1)
    end

    it "redirects to the resumes list" do
      resume = Resume.create! valid_attributes
      delete resume_url(resume)
      expect(response).to redirect_to(resumes_url)
    end
  end
end
