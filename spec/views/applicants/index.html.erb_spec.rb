require 'rails_helper'

RSpec.describe 'applicants/index', type: :view do
  let!(:user) { create(:user) }
  let!(:position) { create(:position) }

  before(:each) do
    assign(:applicants, [
             Applicant.create!(
               name: 'Name',
               email: 'Email',
               phone: 'Phone',
               user:,
               position:
             ),
             Applicant.create!(
               name: 'Name',
               email: 'Email',
               phone: 'Phone',
               user:,
               position:
             )
           ])
  end

  it 'renders a list of applicants' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Email'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Phone'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
