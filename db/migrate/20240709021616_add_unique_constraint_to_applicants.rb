class AddUniqueConstraintToApplicants < ActiveRecord::Migration[7.1]
  def change
    add_index :applicants, %i[user_id position_id], unique: true
  end
end
