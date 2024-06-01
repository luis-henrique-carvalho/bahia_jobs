require 'rails_helper'

RSpec.describe 'positions/index', type: :view do
  let!(:company) { create(:company) }

  before(:each) do
    assign(:positions, [
             Position.create!(
               name: 'Name',
               career: 2,
               contract: 1,
               remote: false,
               city: 'City',
               state: 'State',
               summary: 'MyText',
               description: 'MyText',
               publish: false,
               company:
             ),
             Position.create!(
               name: 'Name',
               career: 2,
               contract: 1,
               remote: false,
               city: 'City',
               state: 'State',
               summary: 'MyText',
               description: 'MyText',
               publish: false,
               company:
             )
           ])
  end

  it 'renders a list of positions' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('City'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('State'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(company.to_s), count: 2
  end
end
