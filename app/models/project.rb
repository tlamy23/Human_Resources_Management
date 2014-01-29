class Project < ActiveRecord::Base
	belongs_to :team
	belongs_to :employee, :foreign_key => 'admin_id'
	alias_attribute :admin, :employee
	belongs_to :calendar_type
	validate :name,:calendar_type_id,:admin, presence:true

	scope :unassigned, joins(:teams)
end
