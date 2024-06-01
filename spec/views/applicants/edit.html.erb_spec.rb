require 'rails_helper'

RSpec.describe 'applicants/edit', type: :view do
  let!(:user) { create(:user) }
  let!(:position) { create(:position) }

  let!(:applicant) do
    Applicant.create!(
      name: 'MyString',
      email: 'MyString',
      phone: 'MyString',
      user:,
      position:
    )
  end

  before(:each) do
    assign(:applicant, applicant)
  end

  it 'renders the edit applicant form' do
    render

    assert_select 'form[action=?][method=?]', applicant_path(applicant), 'post' do
      assert_select 'input[name=?]', 'applicant[name]'

      assert_select 'input[name=?]', 'applicant[email]'

      assert_select 'input[name=?]', 'applicant[phone]'
    end
  end
end
