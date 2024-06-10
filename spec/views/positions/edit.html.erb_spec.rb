require 'rails_helper'

RSpec.describe 'positions/edit', type: :view do
  let(:company) { create(:company) }
  let(:all_tags) { create_list(:tag, 5) }

  before(:each) do
    I18n.locale = 'pt-BR'
    assign(:position, Position.new(company:))
    assign(:tags, all_tags)
    render
  end

  it 'renders new position form with Simple Form inputs and tag selection' do
    render
    assert_select 'form[action=?][method=?]', positions_path, 'post' do
      assert_select 'input[name=?]', 'position[name]'

      assert_select 'select[name=?]', 'position[career]' do
        Position.careers.each do |key, _value|
          assert_select 'option', Position.careers.keys.map(&:to_s).map(&:humanize).include?(key.to_s.humanize)
        end
      end

      assert_select 'select[name=?]', 'position[contract]' do
        Position.contracts.each do |key, _value|
          assert_select 'option', Position.contracts.keys.map(&:to_s).map(&:humanize).include?(key.to_s.humanize)
        end
      end
      assert_select 'input[type=checkbox][name=?]', 'position[remote]'

      assert_select 'input[name=?]', 'position[city]'
      assert_select 'input[name=?]', 'position[state]'

      assert_select 'textarea[name=?]', 'position[summary]'
      assert_select 'textarea[name=?]', 'position[description]'

      assert_select 'input[type=checkbox][name=?]', 'position[publish]'

      assert_select 'select[multiple=multiple][name=?]', 'position[existing_tag_ids][]' do
        all_tags.each do |tag|
          assert_select 'option[value=?]', tag.id.to_s, text: tag.name
        end
      end
    end
  end
end
