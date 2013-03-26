
class GamesController < ApplicationController
  def index
    @games = Game.all
  end
  
  def show
    @game = Game.find(params[:id])
  end
  
  def new
  end
  
  def create
    game = Game.create(params[:game])
    if game
      flash[:notice] = 'Game added successfully'
      redirect_to game_path(game)
    end
  end
  
  def destroy
    game = Game.find(params[:id])
    game.destroy
    flash[:notice] = "#{game.name} was deleted successfully."
    redirect_to games_path
  end
  
  def edit
    @game = Game.find(params[:id])    
  end
  
  def update
    game = Game.find params[:id]
    game.update_attributes!(params[:game])
    flash[:notice] = "#{game.name} was successfully updated."
    redirect_to games_path
  end
end
