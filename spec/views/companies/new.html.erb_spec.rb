require 'rails_helper'

RSpec.describe 'companies/new', type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    assign(:company, Company.new(
                       name: 'MyString',
                       url: 'MyString',
                       user:
                     ))
  end

  it 'renders new company form' do
    render

    assert_select 'form[action=?][method=?]', companies_path, 'post' do
      assert_select 'input[name=?]', 'company[name]'

      assert_select 'input[name=?]', 'company[url]'

    end
  end
end
