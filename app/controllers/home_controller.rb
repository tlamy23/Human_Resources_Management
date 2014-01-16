class HomeController < ApplicationController
  def index
    @day==nil ? @day = Date.today.beginning_of_month : @day=@day.beginning_of_month
  end

  def prevMonth
  	@day=params[:date].to_date
  	@day=@day.to_time.advance(:months=>-1).to_date
  	render :index
  end

  def nextMonth
  	@day=params[:date].to_date
    @day=@day.to_time.advance(:months=>+1).to_date
  	render :index
  end

  def dashboard_day
    @date=params[:date].to_date
  end
  private
  def calendar_params
    params.require(:date)
  end

end