class Employee < ActiveRecord::Base
	validates :name,:first_lastname,presence:true
	belongs_to :team

	scope :unassigned ,joins: "left join projects on projects.admin_id==employees.id left join teams on teams.leader_id==employees.id", 
	conditions: "employees.team_id is null and projects.admin_id is null and teams.leader_id is null"

	scope :alljoins ,joins: "left join projects on projects.admin_id==employees.id left join teams on teams.leader_id==employees.id"
end
