require 'rails_helper'

RSpec.describe "applicants/edit", type: :view do
  let(:applicant) {
    Applicant.create!(
      name: "MyString",
      email: "MyString",
      phone: "MyString",
      user: nil,
      position: nil
    )
  }

  before(:each) do
    assign(:applicant, applicant)
  end

  it "renders the edit applicant form" do
    render

    assert_select "form[action=?][method=?]", applicant_path(applicant), "post" do

      assert_select "input[name=?]", "applicant[name]"

      assert_select "input[name=?]", "applicant[email]"

      assert_select "input[name=?]", "applicant[phone]"

      assert_select "input[name=?]", "applicant[user_id]"

      assert_select "input[name=?]", "applicant[position_id]"
    end
  end
end
