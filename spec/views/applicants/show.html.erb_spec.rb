require 'rails_helper'

RSpec.describe 'applicants/show', type: :view do
  let!(:user) { create(:user) }
  let!(:position) { create(:position) }

  before(:each) do
    assign(:applicant, Applicant.create!(
                         name: 'Name',
                         email: 'Email',
                         phone: 'Phone',
                         user:,
                         position:
                       ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
