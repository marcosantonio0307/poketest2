class PokemonsController < ApplicationController
  before_action :set_team, only:[:new, :create, :destroy]
  def new
  	@pokemon = Pokemon.new
  	@pokemons = PokeApi.get(pokemon: {limit: 100})
  end

  def create
  	pokemon = Pokemon.new(name: params[:name], team_id: @team.id)

  	if pokemon.save
  	  redirect_to team_path(@team)
  	else
  	  render :new
  	end
  end

  def destroy
  	@pokemon = Pokemon.find(params[:id])
  	@pokemon.destroy

  	redirect_to team_path(@team)
  end

  private
    def set_team
      @team = Team.find(params[:team_id])
    end

end
