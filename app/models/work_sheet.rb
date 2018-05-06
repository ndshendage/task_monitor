class WorkSheet < ActiveRecord::Base
    mount_uploader :attachment, AttachmentUploader
	belongs_to :employee

	validates :project_name, :worked_hours, :work_details, presence: true
    validates :work_details, length: { minimum: 20}
end
