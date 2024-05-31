class CreateTaggings < ActiveRecord::Migration[7.1]
  def change
    create_table :taggings, id: :uuid do |t|
      t.references :position, null: false, foreign_key: true, type: :uuid
      t.references :tag, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
