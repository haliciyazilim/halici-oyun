
class GamesController < ApplicationController
  def index
    @games = Game.all
    
    respond_to do |format|
      format.html
      format.json do
        
        if (params[:for_app_name])
          games = Game.where('app_name != ?', params[:for_app_name])
        else 
          games = Game.all
        end
        
        if (params[:lang])
          lang = params[:lang].downcase
        end
        
        
        games = games.map do |game|
          hash = {
            :id => game.id,
            :title => game.title,
            :version => game.version,
            :description_tr => game.description_tr,
            :description_en => game.description_en,
            :app_name => game.app_name
          }
          
          if lang == 'tr' and game.logo1x_tr?
            hash[:logo1x] = game.logo1x_tr.url
          elsif game.logo1x?
            hash[:logo1x] = game.logo1x.url
          end
          
          if lang == 'tr' and game.logo2x_tr?
            hash[:logo2x] = game.logo2x_tr.url
          elsif game.logo2x?
            hash[:logo2x] = game.logo2x.url
          end
          
          if lang == 'tr' and game.logo4x_tr?
            hash[:logo4x] = game.logo4x_tr.url
          elsif game.logo4x?
            hash[:logo4x] = game.logo4x.url
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
        if (params[:lang])
          lang = params[:lang].downcase
        end
        
        
        hash = {
          :id => @game.id,
          :title => @game.title,
          :version => @game.version,
          :description_tr => @game.description_tr,
          :description_en => @game.description_en,
          :app_name => @game.app_name
        }
        
        if lang == 'tr' and @game.logo1x_tr?
          hash[:logo1x] = @game.logo1x_tr.url
        elsif @game.logo1x?
          hash[:logo1x] = @game.logo1x.url
        end
        
        if lang == 'tr' and @game.logo2x_tr?
          hash[:logo2x] = @game.logo2x_tr.url
        elsif @game.logo2x?
          hash[:logo2x] = @game.logo2x.url
        end
        
        if lang == 'tr' and @game.logo4x_tr?
          hash[:logo4x] = @game.logo4x_tr.url
        elsif @game.logo4x?
          hash[:logo4x] = @game.logo4x.url
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
    flash[:notice] = "#{game.title} was deleted successfully."
    redirect_to games_path
  end
  
  def edit
    @game = Game.find(params[:id])    
  end
  
  def update
    game = Game.find params[:id]
    game.update_attributes!(params[:game])
    flash[:notice] = "#{game.title} was successfully updated."
    redirect_to games_path
  end
end
