module ApplicationHelper
	def day_list_content(name,day)
		HomeH.new(name,day).day_list_content
	end

	def day_pathlink_content(name)
		HomeH.new(name).day_pathlink_content
	end

	def day_icon_content(name)
		HomeH.new(name).day_icon_content
	end

	def day_media_content(name,day,object)
		HomeH.new(name,nil,object).day_media_content
	end

	def day_mediabody_content(name,day,object)
		HomeH.new(name,nil,object).day_mediabody_content
	end

	def calendar_days
		days = []
		day = {"label"=> "Sun","wknd"=> true,"clas"=> "col-md-1 col-xs-1 thumbnail alert-warning","clas2"=> "col-md-1 col-xs-1 thumbnail alert-warning"}
		days.push(day)
		day = {"label"=> "Mon","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success"}
		days.push(day)
		day = {"label"=> "Tue","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success"}
		days.push(day)
		day = {"label"=> "Wed","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success"}
		days.push(day)
		day = {"label"=> "Thu","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success"}
		days.push(day)
		day = {"label"=> "Fri","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success"}
		days.push(day)
		day = {"label"=> "Sat","wknd"=> true,"clas"=> "col-md-1 col-xs-1 thumbnail alert-warning","clas2"=> "col-md-1 col-xs-1 thumbnail alert-warning"}
		days.push(day)
		return days
	end
	def calendar_day(day)
  		day=Date.today if day.nil?
		day= day - day.day
		day += 1
	end
end
