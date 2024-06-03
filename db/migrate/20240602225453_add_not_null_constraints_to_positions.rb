class AddNotNullConstraintsToPositions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :positions, :name, false
    change_column_null :positions, :career, false, default: 'developer'
    change_column_null :positions, :contract, false, default: 'clt'
    change_column_null :positions, :remote, false, default: false
    change_column_null :positions, :publish, false, default: true
    change_column_null :positions, :company_id, false
  end
end
