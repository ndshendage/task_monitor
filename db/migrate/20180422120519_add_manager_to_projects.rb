class AddManagerToProjects < ActiveRecord::Migration
  def change
  	add_reference :projects, :manager
  end
end
