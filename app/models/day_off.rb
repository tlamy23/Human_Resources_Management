class DayOff < ActiveRecord::Base
	belongs_to :calendar_type
	validates :name, presence:true
	#scope :perEmployee,lambda{|employee|{:conditions =>{:calendar_type_id=>employee.calendar_type_id}}}
end
