class Employee < ActiveRecord::Base
	validates :name,:first_lastname,presence:true
end
