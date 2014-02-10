class ManageTeamController < ApplicationController
  before_action :set_team, only: [:teams_edit,:update_team,:destroy]

  def index
  	@teams=Team.all
    @projects= Project.all 
    @employees = Employee.unassigned
    @admins = Employee.admins
    @leaders = Employee.leaders
    @teams_unassigned = Team.unassigned
    @team_s = Team.find_by_id(params[:team_s]) if params[:team_s].present?
    if @team_s.present?
      @hml=Haml::Engine.new(".team-selected{name: '#{@team_s.name}',id: '#{@team_s.id}'}")
    else
      @hml=Haml::Engine.new(".team-selected{name: '',id: ''}")
    end
  end

  def teams_content
    @employees = Employee.where(team_id: params["id"])
    @team = Team.find_by_id(params["id"])
    render :json => { :view => render_to_string( :teams_content, :layout => false ) }
  end
  
  def teams_edit
    render :json => { :view => render_to_string( 'team_edit', :layout => false ) }
  end

  def update_team
    @team.update(team_params)
    respond_to do |format|
      flash[:notice] = "Team was updated"
      format.html { redirect_to :action=>'index', :params => {:team_s => @team} }
    end
  end

   def teams_new
    @team = Team.new
    render :json => { :view => render_to_string( 'team_new', :layout => false ) }
   end

   def create_team
    @team = Team.new(team_params)
    respond_to do |format|
      if @team.save
        format.html { redirect_to '/manage_team', notice: 'Team was successfully created.' }
      else
        @errors= @team.errors
        format.html { redirect_to '/manage_team', json: @errors, status: :unprocessable_entity}
      end
    end
   end

   def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to '/manage_team', notice: 'Team was removed.' }
    end
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
