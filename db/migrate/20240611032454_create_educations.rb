class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations, id: :uuid do |t|
      t.string :school_name
      t.integer :degree, null: false, default: 0
      t.string :field_of_study
      t.date :start_date
      t.date :end_date
      t.references :resume, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
