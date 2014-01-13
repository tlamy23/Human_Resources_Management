class HomeH
	def initialize(name,day=nil,object=nil)
		@name=name
		@day=day
		@object=object
	end

	def day_list_content
		if @name == "CarWash"
			ScheduleCarwash.where(date: @day).order(:turn)
		elsif @name == "BirthDate"
			Employee.where(birthdate: @day)
		elsif @name == "DayOff"
			DayOff.where(date: @day)
		end
	end

	def day_pathlink_content
		@name == "CarWash" ? '/schedule_carwashes' : @name == "BirthDate" ? '/employees' : @name == "DayOff" ? '/day_offs' : ""
	end

	def day_icon_content
		if @name=="CarWash"
      		hml=Haml::Engine.new("%span.glyphicon.glyphicon-road")
    	elsif @name=="BirthDate"
      		hml=Haml::Engine.new("%span.glyphicon.glyphicon-gift")
    	elsif @name=="DayOff"
    		hml=Haml::Engine.new("%span.glyphicon.glyphicon-calendar")
    	end
    	hml.render
	end

	def day_media_content
		if @name=="CarWash"
    		@object.employee.image
    	elsif @name=="BirthDate"
	    	@object.image
  		elsif @name=="DayOff"
	    	@object.calendar_type.image
	    end
	end

	def day_mediabody_content
		if @name=="CarWash"
    		"#{@object.employee.name} #{@object.employee.first_lastname}"
    	elsif @name=="BirthDate"
    		"#{@object.name} #{@object.first_lastname}"
    	elsif @name=="DayOff"
    		@object.name
    	end
	end

	def day_controller
		@name == "CarWash" ? 'schedule_carwashes' : @name == "BirthDate" ? 'employees' : @name == "DayOff" ? 'day_offs' : ""
	end

	def day_action
		@name == "CarWash" ? 'byday_schedule_carwash' : @name == "BirthDate" ? 'byday_birthdate' : @name == "DayOff" ? 'byday_day_off' : ""
	end
end
