class Team < ActiveRecord::Base
	belongs_to :employee, :foreign_key => 'leader'
	alias_attribute :leader, :employee
	validates :name,:leader, presence:true
end
