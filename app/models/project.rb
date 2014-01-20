class Project < ActiveRecord::Base
	belongs_to :team, foreign_key: "teams_id"
	belongs_to :employees, foreign_key: "admin"
end
