
class GamesController < ApplicationController
  def index
    @games = Game.all
    
    respond_to do |format|
      format.html
      format.json do
        games = Game.all
        games = games.map do |game|
          hash = {
            :id => game.id,
            :name => game.name,
            :version => game.version,
            :description_tr => game.description_tr,
            :description_en => game.description_en,
            :appId => game.appId
          }
          
          if game.logo?
            hash[:logo] = game.logo.url
          end
          
          if game.logo2x?
            hash[:logo] = game.logo2x.url
          end
          
          hash
        end
        
        render :json => games
      end
    end
  end
  
  def show
    @game = Game.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json do
        hash = {
          :id => @game.id,
          :name => @game.name,
          :version => @game.version,
          :description_tr => @game.description_tr,
          :description_en => @game.description_en,
          :appId => @game.appId
        }
        
        if @game.logo?
          hash[:logo] = @game.logo.url
        end
        
        if @game.logo2x?
          hash[:logo] = @game.logo2x.url
        end
        
        render :json => hash
      end
    end
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
