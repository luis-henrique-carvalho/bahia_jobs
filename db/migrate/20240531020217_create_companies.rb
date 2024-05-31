class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.string :url
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
