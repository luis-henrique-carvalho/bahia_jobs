require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    assign(:company, Company.create!(
      name: "Name",
      url: "Url",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
