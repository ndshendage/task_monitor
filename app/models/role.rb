class Role < ActiveRecord::Base
	validates :designation, :status, presence: true
    validates :designation, uniqueness: true
    has_many :employees
end
