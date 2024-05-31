require 'rails_helper'

RSpec.describe "positions/edit", type: :view do
  let(:position) {
    Position.create!(
      name: "MyString",
      career: 1,
      contract: 1,
      remote: false,
      city: "MyString",
      state: "MyString",
      summary: "MyText",
      description: "MyText",
      publish: false,
      company: nil
    )
  }

  before(:each) do
    assign(:position, position)
  end

  it "renders the edit position form" do
    render

    assert_select "form[action=?][method=?]", position_path(position), "post" do

      assert_select "input[name=?]", "position[name]"

      assert_select "input[name=?]", "position[career]"

      assert_select "input[name=?]", "position[contract]"

      assert_select "input[name=?]", "position[remote]"

      assert_select "input[name=?]", "position[city]"

      assert_select "input[name=?]", "position[state]"

      assert_select "textarea[name=?]", "position[summary]"

      assert_select "textarea[name=?]", "position[description]"

      assert_select "input[name=?]", "position[publish]"

      assert_select "input[name=?]", "position[company_id]"
    end
  end
end
