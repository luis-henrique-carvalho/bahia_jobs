require 'rails_helper'

RSpec.describe "resumes/edit", type: :view do
  let(:resume) {
    Resume.create!(
      summary: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:resume, resume)
  end

  it "renders the edit resume form" do
    render

    assert_select "form[action=?][method=?]", resume_path(resume), "post" do

      assert_select "textarea[name=?]", "resume[summary]"

      assert_select "input[name=?]", "resume[user_id]"
    end
  end
end
