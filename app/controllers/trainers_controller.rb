class TrainersController < ApplicationController
  before_action :set_trainer, only:[:edit, :update, :show]

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

  def update
    if params[:trainer][:profile_image] == nil && @trainer.profile_image.attached?
      values = params.require(:trainer).permit(:name, :age, :gender)
    else
      values = params.require(:trainer).permit(:name, :age, :gender, :profile_image)
    end
    @trainer.update values
    redirect_to trainer_path(@trainer)
  end

  private
    def trainer_params
      params.require(:trainer).permit(:login, :password, :name, :age, :gender)
    end

    def set_trainer
      @trainer = Trainer.find(params[:id])
    end
end
