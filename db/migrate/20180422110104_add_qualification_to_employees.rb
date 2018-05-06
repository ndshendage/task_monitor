class AddQualificationToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :qualification, :string
  end
end
