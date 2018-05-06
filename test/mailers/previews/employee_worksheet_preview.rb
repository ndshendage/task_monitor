# Preview all emails at http://localhost:3000/rails/mailers/employee_worksheet
class EmployeeWorksheetPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/employee_worksheet/reminder
  def reminder
  	worksheet = WorkSheet.last
    mail = EmployeeWorksheet.reminder(worksheet)
  end

end
