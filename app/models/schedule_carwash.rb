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

	def self.generateSchedule(_ePerDay,_startday)
		ePerDay=_ePerDay
		startday=_startday
	    count = (Employee.count.to_s + '.0').to_f 
	    e = Employee.order(first_lastname: :desc)
	    i = (count/ePerDay).ceil
	    while i > 0
	       	ePerDay = _ePerDay
	    	while startday.strftime("%a") == "Sat" || startday.strftime("%a") == "Sun"
	        	startday += 1
	      	end
	      	j=1
	      	while ePerDay > 0
	        	schedule = ScheduleCarwash.new
	        	schedule.turn = j
		        while schedule.employee==nil && count>0
		          	find_e= ScheduleCarwash.where(employee:e[count-1],date: startday)
		          	if find_e.count==0
		            	schedule.employee = e[count-1]
		          	else
		            	count -= 1
		          	end
		        end
		        schedule.date = startday
		        schedule.save
		        count -= 1
		        ePerDay -= 1
		        j += 1
	      	end
	      	i -= 1
	      	startday +=1
    	end
  end

end
