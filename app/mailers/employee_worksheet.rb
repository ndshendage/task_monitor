class EmployeeWorksheet < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.employee_worksheet.reminder.subject
  #
  def reminder(worksheet)
    @worksheet = worksheet
    @employee = Employee.find(@worksheet.employee_id)
    @greeting = "Hi"
    @user = @employee.email
    mail to: @employee.email,
    subject: "You have created a new worksheet"
  end
end
