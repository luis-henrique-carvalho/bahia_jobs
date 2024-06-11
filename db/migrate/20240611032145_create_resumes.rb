class CreateResumes < ActiveRecord::Migration[7.1]
  def change
    create_table :resumes, id: :uuid do |t|
      t.text :summary
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
