class ScheduleCarwash < ActiveRecord::Base
	belongs_to :employee
	validates :date,:turn,:employee, presence:true
	validates_numericality_of :turn, :greater_than_or_equal_to=>0
	validate :compare_date
	def compare_date
		if self.date<Date.today
			self.errors.add :date,'can only be henceforth'
		end
	end
end
