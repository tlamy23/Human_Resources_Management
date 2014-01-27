class Team < ActiveRecord::Base
	belongs_to :employee, :foreign_key => 'leader_id'
	alias_attribute :leader, :employee
	validates :name,:leader, presence:true
end
