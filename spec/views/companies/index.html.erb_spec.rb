require 'rails_helper'

RSpec.describe 'companies/index', type: :view do
  let!(:user) { create(:user) }

  before(:each) do
    assign(:companies, [
             Company.create!(
               name: 'Name',
               url: 'Url',
               user:
             ),
             Company.create!(
               name: 'Name',
               url: 'Url',
               user:
             )
           ])
  end

  it 'renders a list of companies' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Url'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(user.to_s), count: 2
  end
end
