class AddDetailsToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_column :companies, :description, :text
    add_column :companies, :contact_phone, :string
    add_column :companies, :contact_email, :string
    add_column :companies, :founded_date, :date
    add_column :companies, :employee_count, :integer
  end
end
