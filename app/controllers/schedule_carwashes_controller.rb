class ScheduleCarwashesController < ApplicationController
  before_action :set_schedule_carwash, only: [:show, :edit, :update, :destroy]

  # GET /schedule_carwashes
  # GET /schedule_carwashes.json
  def index
    @schedule_carwashes= ScheduleCarwash.list_schedule
  end

  # GET /schedule_carwashes/1
  # GET /schedule_carwashes/1.json
  def show
  end

  # GET /schedule_carwashes/new
  def new
    @schedule_carwash = ScheduleCarwash.new
  end

  # GET /schedule_carwashes/1/edit
  def edit
  end

  # POST /schedule_carwashes
  # POST /schedule_carwashes.json
  def create
    @schedule_carwash = ScheduleCarwash.new(schedule_carwash_params)
    @date=@schedule_carwash.date
    @day=ScheduleCarwash.where(date:@date).order(:turn)
    @bndr=false
    if @day.count<5
      @i=1
      while @i<6
        begin
          @d=@day.find_by(:turn=>@i)
        rescue
          @d=nil
        end
        if @d!=nil
          @i += 1
        else
          @schedule_carwash.turn=@i
          @bndr= @schedule_carwash.save
          break
        end
      end 
      respond_to do |format|
        format.html { redirect_to @schedule_carwash, notice: 'Schedule carwash was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule_carwash }
        @errors=@schedule_carwash.errors
      end
    else
      respond_to do |format|
        @schedule_carwash.errors.add :date,'the Schedule day selected is complete'
        format.html { render action: 'new' }
        @errors=@schedule_carwash.errors
      end
    end
  end

  # PATCH/PUT /schedule_carwashes/1
  # PATCH/PUT /schedule_carwashes/1.json
  def update
    respond_to do |format|
      if @schedule_carwash.update(schedule_carwash_params)
        format.html { redirect_to @schedule_carwash, notice: 'Schedule carwash was successfully updated.' }
        format.json { head :no_content }
      else
        @errors=@schedule_carwash.errors
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /schedule_carwashes/1
  # DELETE /schedule_carwashes/1.json
  def destroy
    @schedule_carwash.destroy
    respond_to do |format|
      format.html { redirect_to schedule_carwashes_url }
      format.json { head :no_content }
    end
  end

  def generateSchedule
    date=params[:start_date]
    startday = Date.new date["date(1i)"].to_i, date["date(2i)"].to_i, date["date(3i)"].to_i
    ScheduleCarwash.generateSchedule(params[:per_day].to_f,startday)
    respond_to do |format|
      format.html { redirect_to schedule_carwashes_url }
      format.json { head :no_content }
    end
  end

  def byday_schedule_carwash
    @schedule_carwashes=ScheduleCarwash.where(date: params[:day]).order(:turn)
    @day=params[:day]
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_carwash
      @schedule_carwash = ScheduleCarwash.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_carwash_params
      params.require(:schedule_carwash).permit(:date, :turn, :employee_id)
    end

    def byday_params
      params.require(:day)
    end

    def generateSchedule_params
      params.require(:start_date, :per_day)
    end
end
