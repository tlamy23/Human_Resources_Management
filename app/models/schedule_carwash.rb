class ScheduleCarwash < ActiveRecord::Base
	belongs_to :employee
	validates :date,:turn,:employee, presence:true
	validates_numericality_of :turn, :greater_than_or_equal_to=>0
	validate :compare_date, on: :create
	validates :employee, uniqueness: { scope: :date, message: "can only happen once a day per employee" }, if: "employee.present?"

	def compare_date
		if self.date < Date.today
			self.errors.add :date,'can only be henceforth'
		end
	end

	def self.list_schedule
		dates=ScheduleCarwash.where("date>current_date").group("date(date)")
    	schedule_carwashes = []
	    dates.each do |d|
	      schedule_carwash=ScheduleCarwash.where(date: d.date).order("date,turn")
	      schedule_carwash_item={"date"=> d.date, "list"=>schedule_carwash}
	      schedule_carwashes.push(schedule_carwash_item)
	    end
	    schedule_carwashes
	end
end
