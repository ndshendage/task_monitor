class Task < ActiveRecord::Base
	#CONSTANTS
	STATUS = ['new', 'inprogress', 'done']
	#VALIDATIONS
    validates_presence_of :name, :description, :project_id#, :status
    validates_inclusion_of :status, in: STATUS, message: "should be from #{STATUS.join(', ')}"
	#ASSOCIATIONS
	belongs_to :employee
	belongs_to :project
    before_save :validate_end_date_time
	#SCOPES
    scope :task_details_for_manager, -> (state) { where(status: state)}

    def validate_end_date_time
		status = self.start_date < self.end_date if start_date.present? && end_date.present?
	    errors.add(:end_date, "cannot be before #{start_date}") if start_date.present? && !status
	    status   
	end
end
