require 'rails_helper'
include Pagy::Backend

RSpec.describe 'positions/index', type: :view do
  let!(:company) { create(:company) }
  let!(:tags) { create_list(:tag, 3) }
  let!(:position) { create(:position, company:, tags:) }

  before(:each) do
    @search = Position.all.ransack(params[:q])
    @pagy, @positions = pagy(@search.result)

    render
  end

  it 'renders a list of positions with correct details' do
    # Assertions for the index view's main content
    expect(rendered).to match(/Lista de vagas/)
    expect(rendered).to match(/Pesquise sua vaga por Tags/)

    # Assertions for each position card
    @positions.each do |position|
      expect(rendered).to match(/#{position.name}/)
      expect(rendered).to match(/#{position.company.name}/)
      expect(rendered).to match(/#{position.summary}/)
      expect(rendered).to match(/#{position.created_at.strftime('%d/%m/%Y')}/)

      if position.remote
        expect(rendered).to match(/Remoto/)
      else
        expect(rendered).to match(/#{position.state}/)
      end

      position.tags.each do |tag|
        expect(rendered).to match(/#{tag.name}/)
      end
    end

    expect(rendered).to have_selector('nav.pagy-bootstrap')
  end
end
