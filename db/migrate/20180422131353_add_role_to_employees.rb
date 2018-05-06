class AddRoleToEmployees < ActiveRecord::Migration
  def change
  	add_column :employees, :role, :string, default: 'developer'
  end
end
