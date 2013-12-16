class Employee < ActiveRecord::Base
	belongs_to :calendar_type
	validates :name,:first_lastname,:calendar_type_id,presence:true
end
