class TrainersController < ApplicationController
  before_action :authenticate_trainer!, only:[:index]
  def index
  	@trainers = Trainer.all
  	@teams = current_trainer.teams
  end

  def new
  	@trainer = Trainer.new
  end

  def create
  	@trainer = Trainer.new(trainer_params)

  	if Trainer.all.map{|t| t.login}.include? @trainer.login
  	  render :new
  	else
	  redirect_to root_path
	end
  end

  private
    def trainer_params
      params.require(:trainer).permit(:login, :password, :name, :age, :gender)
    end
end
