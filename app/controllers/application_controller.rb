class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :gender, :department, :birth_date, :contact_no, :qualification, :joining_date, :blood_group, :role_id, :company_id)}
  end
  
  def current_user
  	current_user = current_employee
  end
  
  def authorize_admin_role
    return true if current_employee.admin? || current_employee.super_admin?
    redirect_to :back, alert: 'You are not authorized to access it' and return  if request.env["HTTP_REFERER"]
    redirect_path = current_employee.admin? ? manager_path : employee_path
    redirect_to redirect_path
  end

  def can_update_or_destroy
    begin
      redirect_to :back, alert: 'You are not authorized to update it' if current_employee.admin? && @project.manager != current_employee
      true
    rescue
      redirect_to :back, alert: 'You are not authorized to update it'
    end
  end

  def after_sign_in_path_for(resource)
    if resource.super_admin? || resource.admin?
      manager_path
    else
      root_path
    end
  end
end
