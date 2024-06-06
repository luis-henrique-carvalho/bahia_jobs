class RemoveDescriptionFromCompany < ActiveRecord::Migration[7.1]
  def up
    remove_column :companies, :description
  end

  def down
    add_column :companies, :description, :text
  end
end
