class CreateTableEmployeesProjects < ActiveRecord::Migration
  def change
    create_table :employees_projects, id: false do |t|
    	t.references :project
    	t.references :employee
    end
  end
end
