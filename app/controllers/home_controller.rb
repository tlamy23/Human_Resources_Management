class HomeController < ApplicationController
  def index
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