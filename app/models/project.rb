class Project < ActiveRecord::Base
	belongs_to :team
	belongs_to :employee, :foreign_key => 'admin'
	alias_attribute :admin, :employee
	belongs_to :calendar_type
end
