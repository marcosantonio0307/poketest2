class TeamsController < ApplicationController
  before_action :set_team, only:[:show]
  
  def index
    if current_trainer.name == nil
      redirect_to edit_trainer_path(current_trainer)
    end
    @teams = current_trainer.teams
  end

  def new
  	@team = Team.new
  end

  def create
  	@team = Team.new(team_params)
  	@team.trainer_id = current_trainer.id

  	if @team.save
  	  redirect_to root_path
  	else
  	  render :new
  	end
  end

  def show
  end

  private
    def team_params
      params.require(:team).permit(:name)
    end

    def set_team
      @team = Team.find(params[:id])
    end
end
