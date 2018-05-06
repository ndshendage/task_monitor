class Company < ActiveRecord::Base
	validates :company_name, :registration_id, :start_date, :address, :website, presence: true
	validates :company_name, uniqueness: true 
    
    has_many :employees

end
