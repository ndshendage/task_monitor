class PagesController < ApplicationController
  before_action :authenticate_employee!, except: [:home]
  
  def employee
    @projects = current_employee.projects
  end

  def manager
  	@projects = current_employee.projects
  	@projects =  Project.all if current_employee.super_admin? 
  	@developers = Employee.developers
  	@states = Task::STATUS
  end

  def home
  end
end
