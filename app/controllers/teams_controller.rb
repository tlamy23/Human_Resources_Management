class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { redirect_to @team, notice: 'Team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @team }
      else
        @errors= @team.errors
        format.html { render action: 'new' }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        @errors= @team.errors
        format.html { render action: 'edit' }
        format.json { render json: @errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  def manage_team
    @teams=Team.all
    @projects= Project.all 
    @employees = Employee.unassigned
    @admins = Employee.alljoins.where("projects.admin_id is not null")
    @leaders = Employee.alljoins.where("teams.leader_id is not null")
    @teams_unassigned = Team.unassigned
  end

  def teams_content
    @employees = Employee.where(team_id: params["id"])
    @team = Team.find_by_id(params["id"])
    render :json => { :view => render_to_string( :teams_content, :layout => false ) }
  end
  
  def teams_edit
    @team = Team.find(params["id"])
    render :json => { :view => render_to_string( 'team_edit', :layout => false ) }
  end

  def update_team
    @team = Team.find_by_id(params[:id])
    @team.update(team_params)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :leader_id)
    end
end
