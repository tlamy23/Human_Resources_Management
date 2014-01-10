class DayOff < ActiveRecord::Base
	belongs_to :calendar_type
	validates :name,:calendar_type,presence:true
end
