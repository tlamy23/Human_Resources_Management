class TeamH
  def initialize(team)
    @team=team
  end
  def get_teamemployees
    Employee.where(team: @team)
  end
end
