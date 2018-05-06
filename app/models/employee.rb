class Employee < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
          :validatable
  validates :first_name, :last_name, :gender, :birth_date, :blood_group,  
             :contact_no, :qualification, :joining_date, :department, presence: true;
  has_and_belongs_to_many :projects#, foreign_key: 'project_id'
  has_many :tasks
  scope :managers, -> {where(role: "admin")}
  scope :developers, -> {where(role: "developer")}
  
  def create_project?
    self.admin? || self.super_admin?
  end

  def admin?
  	self.role.eql?('admin')
  end

  def developer?
  	self.role.eql?('developer')
  end

  def super_admin?
  	self.role.eql?('super_admin')
  end

  def name
    self.first_name + " " + self.last_name
  end
end
