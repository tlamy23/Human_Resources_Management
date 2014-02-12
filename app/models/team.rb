class Team < ActiveRecord::Base
	belongs_to :employee, :foreign_key => 'leader_id'
	alias_attribute :leader, :employee
	validates :name,:leader, presence:true
	scope :unassigned, joins: "left join projects on projects.team_id == teams.id", conditions: "projects.id is null"
end
