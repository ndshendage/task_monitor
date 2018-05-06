class Project < ActiveRecord::Base
    #VALIDATIONS
    validates_presence_of :name, :description, :manager_id, :location, :client_name
	#CALLBACKS
	before_save :validate_end_date
	# ASSOCIATIONS
	has_and_belongs_to_many :employees#, foreign_key: 'employee_id'
	belongs_to :manager, class_name: 'Employee', foreign_key: 'manager_id'
	has_many :tasks
    
    #INSTANCE METHODS
	def employee_tasks(employee_id)
		self.tasks.where(employee_id: employee_id)
	end

	def validate_end_date
		status = self.start_date <= self.end_date if start_date.present? && end_date.present?
	    errors.add(:end_date, "cannot be before #{start_date}") if start_date.present? && !status
	    status   
	end
end
