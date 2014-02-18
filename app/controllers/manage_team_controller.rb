class ManageTeamController < ApplicationController
  before_action :set_team, only: [:teams_edit,:update_team,:destroy_team]
  before_action :set_project, only: [:create_projects, :update_project, :projects_edit, :destroy_project]

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

    @project_s = Project.find_by_id(params[:project_s]) if params[:project_s].present?
    if @project_s.present?
      @hml_project=Haml::Engine.new(".project-selected{name: '#{@project_s.name}',id: '#{@project_s.id}'}")
    else
      @hml_project=Haml::Engine.new(".project-selected{name: '',id: ''}")
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
    respond_to do |format|
      if @team.update(team_params)
        flash[:notice] = "Team was successfully updated"
        format.html { redirect_to :action=>'index', :params => {:team_s => @team} }
      else
        @errors= @team.errors
        flash[:error] = @errors.full_messages.join(', ')
        format.html { redirect_to '/manage_team' }
      end
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
        flash[:error] = @errors.full_messages.join(', ')
        format.html { redirect_to '/manage_team' }
      end
    end
   end

   def destroy_team
    @team.destroy
    respond_to do |format|
      format.html { redirect_to '/manage_team', notice: 'Team was removed.' }
    end
  end

  def projects_new
    @project = Project.new
    render :json => { :view => render_to_string( 'project_new', :layout => false ) }
   end

   def create_project
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
        format.html { redirect_to '/manage_team', notice: 'Project was successfully created.' }
      else
        @errors= @project.errors
        flash[:error] = @errors.full_messages.join(', ')
        format.html { redirect_to '/manage_team' }
      end
    end
   end
   
   def projects_edit
    render :json => { :view => render_to_string( 'project_edit', :layout => false ) }
  end

  def update_project
    respond_to do |format|
      if @project.update(project_params)
        flash[:notice] = "Team was successfully updated"
        format.html { redirect_to :action=>'index', :params => {:project_s => @project} }
      else
        @errors= @project.errors
        flash[:error] = @errors.full_messages.join(', ')
        format.html { redirect_to '/manage_team' }
      end
    end
  end

  def destroy_project
    @project.destroy
    respond_to do |format|
      format.html { redirect_to '/manage_team', notice: 'Team was removed.' }
    end
  end

  def popover_employees
    @employee = Employee.find_by_id(params["id"])
    render :json => { :view => render_to_string( 'popover_employees', :layout => false ) }
  end

  private
      # Use callbacks to share common setup or constraints between actions.
      def set_team
        @team = Team.find(params[:id])
      end

      def set_project
        @project = Project.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def team_params
        params.require(:team).permit(:name, :leader_id)
      end

      def project_params
        params.require(:project).permit(:name,:team_id,:admin_id,:calendar_type_id)
      end
end
