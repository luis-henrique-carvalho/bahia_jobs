class AddSalaryRangeToPositions < ActiveRecord::Migration[7.1]
  def change
    add_column :positions, :salary_min, :decimal, precision: 10, scale: 2, null: false, default: 0
    add_column :positions, :salary_max, :decimal, precision: 10, scale: 2, null: false, default: 0
  end
end
