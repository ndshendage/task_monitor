# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# seed file for running the application with some default data

super_admin = YAML.load_file("#{Rails.root}/config/data/employee_data.yml")["employee"]["super_admin"]

super_admin.each do |key, options|
  employee = Employee.create!(first_name: options['first_name'],
  	last_name: options["last_name"],
  	blood_group: options['blood_group'],
  	contact_no: options['contact_no'],
  	birth_date: options['birth_date'],
  	joining_date: options['joinning_date'],
  	department: options['department'],
  	qualification: options['qualification'],
  	email: options['email'],
  	password: options['password'],
  	gender: options['gender'],
  	role: 'super_admin'
  	)
end

managers = YAML.load_file("#{Rails.root}/config/data/employee_data.yml")["employee"]["admin"]

managers.each do |key, options|
  employee = Employee.create!(first_name: options['first_name'],
  	last_name: options["last_name"],
  	blood_group: options['blood_group'],
  	contact_no: options['contact_no'],
  	birth_date: options['birth_date'],
  	joining_date: options['joinning_date'],
  	department: options['department'],
  	qualification: options['qualification'],
  	email: options['email'],
  	password: options['password'],
  	gender: options['gender'],
  	role: 'admin'
  	)
end

developers = YAML.load_file("#{Rails.root}/config/data/employee_data.yml")["employee"]["developer"]

developers.each do |key, options|
  employee = Employee.create!(first_name: options['first_name'],
  	last_name: options["last_name"],
  	blood_group: options['blood_group'],
  	contact_no: options['contact_no'],
  	birth_date: options['birth_date'],
  	joining_date: options['joinning_date'],
  	department: options['department'],
  	qualification: options['qualification'],
  	email: options['email'],
  	password: options['password'],
  	gender: options['gender']
  	)
end