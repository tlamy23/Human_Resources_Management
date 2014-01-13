class DashboardDayH
	def initialize(name,date)
		@name=name
		@date=date
	end

	def dashbard_day_getlist
		if @name=="CarWash"
			@list = ScheduleCarwash.where(date: @date).order(:turn)
			@title = "Listing Schedule CarWash"
		elsif @name == "BirthDate"
			@list = Employee.where(birthdate: @date)
			@title = "Listing BirthDates"
		elsif @name == "DayOff"
			@list = DayOff.where(date: @date)
			@title = "Listing Days Off"
		end
		list={"list"=>@list,"title"=>@title}
		return list
	end
end