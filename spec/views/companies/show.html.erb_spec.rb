require 'rails_helper'

RSpec.describe 'companies/show', type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    assign(:company, Company.create!(
                       name: 'Name',
                       url: 'Url',
                       user:
                     ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
