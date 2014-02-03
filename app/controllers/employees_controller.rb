class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    upload

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
      else
        @errors=@employee.errors
        format.html { render action: 'new'}
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    upload
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        @errors=@employee.errors
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url }
      format.json { head :no_content }
    end
  end

  def upload
    uploaded_io = params[:employee][:dataimage]
    if uploaded_io!=nil
      puts("PARAMETROS"+uploaded_io.original_filename)
      if File.exist?('app/assets/images/employees/'+@employee.name+@employee.first_lastname+File.extname(uploaded_io.original_filename))
        File.delete('app/assets/images/employees/'+@employee.name+@employee.first_lastname+File.extname(uploaded_io.original_filename))
      end
      File.open(Rails.root.join('app/assets/images/', 'employees', @employee.name+@employee.first_lastname+File.extname(uploaded_io.original_filename)), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @employee.image='employees/'+@employee.name+@employee.first_lastname+File.extname(uploaded_io.original_filename) 
    end
  end

  def byday_birthdate
    @day=params[:day].to_date
    @employees=Employee.find(:all, :conditions => ["STRFTIME('%m-%d', birthdate) = ?", @day.strftime("%m-%d")])
  end

  def add_remove_team
    @employee = Employee.find_by_id(params["id"])
    if params["team_id"]!= "null"
      team_id=params["team_id"]
    else
      team_id=nil
    end
    respond_to do |format|
      if @employee.update(team_id: team_id)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
      else
        @errors=@employee.errors
        format.html { render action: '/manage_team' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:name, :first_lastname, :second_lastname,:birthdate,:image,:team_id)
    end
    def image_params
      params.require(:employee).permit( :dataimage)
    end

    def bydate_params
      params.require(:day)
    end
end
