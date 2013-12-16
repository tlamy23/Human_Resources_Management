class CalendarTypesController < ApplicationController
  before_action :set_calendar_type, only: [:show, :edit, :update, :destroy]

  # GET /calendar_types
  # GET /calendar_types.json
  def index
    @calendar_types = CalendarType.all
  end

  # GET /calendar_types/1
  # GET /calendar_types/1.json
  def show
  end

  # GET /calendar_types/new
  def new
    @calendar_type = CalendarType.new
  end

  # GET /calendar_types/1/edit
  def edit
  end

  # POST /calendar_types
  # POST /calendar_types.json
  def create
    @calendar_type = CalendarType.new(calendar_type_params)
    upload
    respond_to do |format|
      if @calendar_type.save
        format.html { redirect_to @calendar_type, notice: 'Calendar type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @calendar_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @calendar_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calendar_types/1
  # PATCH/PUT /calendar_types/1.json
  def update
    upload
    respond_to do |format|
      if @calendar_type.update(calendar_type_params)
        format.html { redirect_to @calendar_type, notice: 'Calendar type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @calendar_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calendar_types/1
  # DELETE /calendar_types/1.json
  def destroy
    @calendar_type.destroy
    respond_to do |format|
      format.html { redirect_to calendar_types_url }
      format.json { head :no_content }
    end
  end

  def upload
    uploaded_io = params[:calendar_type][:dataimage]
    if uploaded_io!=nil
      puts("PARAMETROS"+uploaded_io.original_filename)
      if File.exist?('app/assets/images/flags/'+@calendar_type.name+File.extname(uploaded_io.original_filename))
        File.delete('app/assets/images/flags/'+@calendar_type.name+File.extname(uploaded_io.original_filename))
      end
      File.open(Rails.root.join('app/assets/images/', 'flags', @calendar_type.name+File.extname(uploaded_io.original_filename)), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      @calendar_type.image='flags/'+@calendar_type.name+File.extname(uploaded_io.original_filename) 
    else
      @calendar_type.image=""
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calendar_type
      @calendar_type = CalendarType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calendar_type_params
      params.require(:calendar_type).permit(:name, :image)
    end
    def image_params
      params.require(:calendar_type).permit( :dataimage)
    end
end
