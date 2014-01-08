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
end
