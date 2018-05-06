class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_employee!
  before_action :authorize_rights_for_task, except: [:index]
  # GET /tasks
  # GET /tasks.json
  def index
    @project = Project.find_by(id: params[:project_id])
    @tasks = @project.tasks.where(employee: current_employee) unless current_employee.create_project?
    @tasks = @project.tasks if current_employee.create_project?
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @project = Project.find_by(id: params[:project_id])
    @task = Task.new
    @developers = @project.employees.developers
  end

  # GET /tasks/1/edit
  def edit
    @project = @task.project
    @developers = @project.employees.developers
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to project_task_path(@task.project, @task), notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        @project = @task.project
        @developers = @project.employees.developers
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @project = @task.project
    @developers = @project.employees.developers
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to project_task_path(@task.project, @task), notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        @developers = Employee.developers
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @project = @task.project
    @task.destroy
    respond_to do |format|
      format.html { redirect_to project_tasks_url(@project), notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def authorize_rights_for_task
      return true if current_employee.super_admin? || @task.project.manager == current_employee || @task.employee == current_employee
      redirect_url = current_employee.admin? ? manager_path : employee_path
      redirect_to redirect_url, alert: 'You are not authorized to view/modify it'
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :description, :employee_id, :project_id, :start_date, :end_date, :status)
    end
end
