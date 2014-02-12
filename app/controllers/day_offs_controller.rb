class DayOffsController < ApplicationController
  before_action :set_day_off, only: [:show, :edit, :update, :destroy]

  # GET /day_offs
  # GET /day_offs.json
  def index
    @day_offs = DayOff.all
  end

  # GET /day_offs/1
  # GET /day_offs/1.json
  def show
  end

  # GET /day_offs/new
  def new
    @day_off = DayOff.new
  end

  # GET /day_offs/1/edit
  def edit
  end

  # POST /day_offs
  # POST /day_offs.json
  def create
    @day_off_tmp = params[:calendar_type_id]
    @day_off = DayOff.new(day_off_params)
    if @day_off_tmp!=nil && @day_off.name !=""
      @day_off_tmp.each do |id|
        @day_off = DayOff.new(day_off_params)
        @day_off.calendar_type_id = id
        @day_off.save
      end
    else
      respond_to do |format|
        if @day_off.save
            format.html { redirect_to @day_off, notice: 'Day Off was successfully created.' }
        else
            @errors=@day_off.errors
            format.html { render action: 'new' }
        end
      end
    end
  end

  # PATCH/PUT /day_offs/1
  # PATCH/PUT /day_offs/1.json
  def update
    respond_to do |format|
      if @day_off.update(day_off_params)
        format.html { redirect_to @day_off, notice: 'Day off was successfully updated.' }
      else
        @day_off.errors
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /day_offs/1
  # DELETE /day_offs/1.json
  def destroy
    @day_off.destroy
    respond_to do |format|
      format.html { redirect_to day_offs_url }
      format.json { head :no_content }
    end
  end

  def byday_day_off
    @day=params[:day].to_date
    @day_offs=DayOff.find(:all, :conditions =>  ["STRFTIME('%m-%d', date) = ?", @day.strftime("%m-%d")])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_day_off
      @day_off = DayOff.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def day_off_params
      params.require(:day_off).permit(:name, :date, :calendar_type_id)
    end

    def byday_params
      params.require(:day)
    end
end
