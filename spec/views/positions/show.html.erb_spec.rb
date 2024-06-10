require 'rails_helper'

RSpec.describe 'positions/show', type: :view do
  let(:company) do
    create(:company, name: 'Awesome Company')
  end

  let(:position) do
    create(:position, company:, name: 'PJ Developer Position')
  end

  before(:each) do
    assign(:position, position)
    render
  end

  it 'renders position and company attributes' do
    expect(rendered).to match(position.name)
    expect(rendered).to match(I18n.t("enums.position.career.#{position.career}"))
    expect(rendered).to match(position.contract.upcase)
    expect(rendered).to match(position.description)
    expect(rendered).to match(position.company.name)
  end
end
