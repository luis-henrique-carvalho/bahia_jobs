require 'rails_helper'

RSpec.describe 'companies/edit', type: :view do
  let!(:user) { create(:user) }

  let(:company) do
    Company.create!(
      name: 'MyString',
      url: 'MyString',
      user:
    )
  end

  before(:each) do
    assign(:company, company)
  end

  it 'renders the edit company form' do
    render

    assert_select 'form[action=?][method=?]', company_path(company), 'post' do
      assert_select 'input[name=?]', 'company[name]'

      assert_select 'input[name=?]', 'company[url]'
    end
  end
end
