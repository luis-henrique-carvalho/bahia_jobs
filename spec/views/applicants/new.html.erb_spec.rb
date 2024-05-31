require 'rails_helper'

RSpec.describe "applicants/new", type: :view do
  before(:each) do
    assign(:applicant, Applicant.new(
      name: "MyString",
      email: "MyString",
      phone: "MyString",
      user: nil,
      position: nil
    ))
  end

  it "renders new applicant form" do
    render

    assert_select "form[action=?][method=?]", applicants_path, "post" do

      assert_select "input[name=?]", "applicant[name]"

      assert_select "input[name=?]", "applicant[email]"

      assert_select "input[name=?]", "applicant[phone]"

      assert_select "input[name=?]", "applicant[user_id]"

      assert_select "input[name=?]", "applicant[position_id]"
    end
  end
end
