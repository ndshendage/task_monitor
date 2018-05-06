class AddFirstNameToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :birth_date, :date
    add_column :employees, :gender, :string
    add_column :employees, :blood_group, :string
    add_column :employees, :contact_no, :string
    add_column :employees, :joining_date, :date
    add_column :employees, :department, :string
    end
end
