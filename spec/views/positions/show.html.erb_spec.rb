require 'rails_helper'

RSpec.describe "positions/show", type: :view do
  before(:each) do
    assign(:position, Position.create!(
      name: "Name",
      career: 2,
      contract: 3,
      remote: false,
      city: "City",
      state: "State",
      summary: "MyText",
      description: "MyText",
      publish: false,
      company: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
  end
end
