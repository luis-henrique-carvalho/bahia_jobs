require 'rails_helper'

RSpec.describe "resumes/new", type: :view do
  before(:each) do
    assign(:resume, Resume.new(
      summary: "MyText",
      user: nil
    ))
  end

  it "renders new resume form" do
    render

    assert_select "form[action=?][method=?]", resumes_path, "post" do

      assert_select "textarea[name=?]", "resume[summary]"

      assert_select "input[name=?]", "resume[user_id]"
    end
  end
end
