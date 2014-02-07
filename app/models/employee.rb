class Employee < ActiveRecord::Base
  validates :name,:first_lastname,presence:true
  belongs_to :team

  scope :alljoins ,joins: "left join projects on projects.admin_id==employees.id left join teams on teams.leader_id==employees.id"

  def self.unassigned
  	alljoins.where("employees.team_id is null and projects.admin_id is null and teams.leader_id is null")
  end
  scope :admins, alljoins.where("projects.admin_id is not null")
  scope :leaders, alljoins.where("teams.leader_id is not null")
end
