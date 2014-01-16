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

	def day_controller(name)
		HomeH.new(name).day_controller
	end

	def day_action(name)
		HomeH.new(name).day_action
	end

	def dashbard_day_getlist(name,date)
		DashboardDayH.new(name,date).dashbard_day_getlist
	end


	def calendar_days
		days = []
		day = {"label"=> "Sun","wknd"=> true,"clas"=> "col-md-1 col-xs-1 thumbnail alert-warning","clas2"=> "col-md-1 col-xs-1 thumbnail alert-warning", "id"=> 0}
		days.push(day)
		day = {"label"=> "Mon","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success", "id"=> 1}
		days.push(day)
		day = {"label"=> "Tue","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success", "id"=> 2}
		days.push(day)
		day = {"label"=> "Wed","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success", "id"=> 3}
		days.push(day)
		day = {"label"=> "Thu","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success", "id"=> 4}
		days.push(day)
		day = {"label"=> "Fri","wknd"=> false,"clas"=> "col-md-2 col-xs-2 thumbnail alert-info","clas2"=> "col-md-2 col-xs-2 thumbnail alert-success", "id"=> 5}
		days.push(day)
		day = {"label"=> "Sat","wknd"=> true,"clas"=> "col-md-1 col-xs-1 thumbnail alert-warning","clas2"=> "col-md-1 col-xs-1 thumbnail alert-warning", "id"=> 6}
		days.push(day)
		return days
	end
	
	def calendar_ndays(day)
		day=day.beginning_of_month
		u=calendar_unless_days(day)
		g=calendar_grater_days(day)
		g=g+u
		sd=day-u
		days = {"start_day" => sd,"ndays" => g}
		return days
	end

	def calendar_unless_days(start_day)
		days=calendar_days
    n=0
		days.each do|d|
      if @dayn.strftime("%a") == d["label"]
        n=d["id"]
      end
    end
    return n
	end

	def calendar_grater_days(start_day)
    days=calendar_days
    month=start_day.month
    n=0
    while month == start_day.month
      days.each do|d|
        start_day += 1
        n += 1
      end
    end
    return n
	end

  def calendar_dayclass(month,month_compare,object)
    if month != month_compare
      if object["wknd"]==true
        return object["clas2"]="col-md-1 col-xs-1 thumbnail alert-danger"
      else
        return object["clas2"]="col-md-2 col-xs-2 thumbnail alert-danger"
      end
    else
      if object["wknd"]==true
        return object["clas2"]="col-md-1 col-xs-1 thumbnail alert-warning"
      else
        return object["clas2"]="col-md-2 col-xs-2 btn-info thumbnail alert-success"
      end
    end
  end
end
