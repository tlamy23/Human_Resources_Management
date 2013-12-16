class ScheduleCarwashesController < ApplicationController
  before_action :set_schedule_carwash, only: [:show, :edit, :update, :destroy]

  # GET /schedule_carwashes
  # GET /schedule_carwashes.json
  def index
    @schedule_carwashes = ScheduleCarwash.all.order("date,turn")
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
          puts('find:'+@i.to_s)
          puts(@d.date.to_s)
          puts(@d.employee.name)
          puts(@d.turn.to_s)
          @i += 1
        else
          puts('not find:'+@i.to_s)
          @schedule_carwash.turn=@i
          puts('guardando')
          @bndr= @schedule_carwash.save
          break
        end
      end 
      respond_to do |format|
        format.html { redirect_to @schedule_carwash, notice: 'Schedule carwash was successfully created.' }
        format.json { render action: 'show', status: :created, location: @schedule_carwash }
        format.html { render action: 'new' }
        format.json { render json: @schedule_carwash.errors, status: :unprocessable_entity }
      end
    else
      respond_to do |format|
        @schedule_carwash.errors.add :date,'the Schedule day selected is complete'
        format.html { render action: 'new' }
        format.json { render json: @schedule_carwash.errors, status: :unprocessable_entity }
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
        format.html { render action: 'edit' }
        format.json { render json: @schedule_carwash.errors, status: :unprocessable_entity }
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
    puts("start schedule")

    @count = (Employee.count.to_s + '.0').to_f 
    puts("count "+ @count.to_s)

    @ePerDay = 5.0
    puts("ePerDay " + @ePerDay.to_s)

    @e = Employee.order(first_lastname: :desc)
    @e.each do |e|
      puts(e.name + ' ' + e.first_lastname)
    end

    @i = (@count/@ePerDay).ceil
    puts("i " + @i.to_s)

    @startday = Date.today
    puts("startday " + @startday.to_s)
    
    while @i > 0
       @ePerDay = 5.0
       puts("ePerDay " + @ePerDay.to_s)

      while @startday.strftime("%a") == "Sat" || @startday.strftime("%a") == "Sun"
        puts("startday" + @startday.to_s)

        @startday += 1
        puts("startday" + @startday.to_s)
      end
      @j=1
      while @ePerDay > 0
        @schedule = ScheduleCarwash.new
        @schedule.turn = @j
        @schedule.employee = @e[@count-1]
        @schedule.date = @startday
        puts(@schedule.employee.name + ' ' + @schedule.employee.first_lastname)

        @save=@schedule.save
        puts("Save schedule: " + @save.to_s)

        @count -= 1
        puts("count "+ @count.to_s)

        @ePerDay -= 1
        puts("ePerDay " + @ePerDay.to_s)

        @j += 1
        puts("j " + @j.to_s)
      end
      @i -= 1
      puts("i " + @i.to_s)

      @startday +=1
      puts("startday " + @startday.to_s)
    end
    redirect_to "/schedule_carwashes#index"
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
end
