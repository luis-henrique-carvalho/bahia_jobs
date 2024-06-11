class CreateExperiences < ActiveRecord::Migration[7.1]
  def change
    create_table :experiences, id: :uuid do |t|
      t.string :company_name
      t.string :position
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :resume, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
