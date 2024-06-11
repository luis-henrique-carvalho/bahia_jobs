class CreateSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :skills, id: :uuid do |t|
      t.string :name
      t.integer :proficiency
      t.references :resume, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
