
require 'digest/sha1'

class DimController < ApplicationController
  def get_user
    if !params[:gc_id]
      @error = true
      @error_text = "You need to supply the Game Center id by gc_id"
    else
      digest = params[:gc_id] + 'AG(JGAF!8E'
      if params[:dg] != Digest::SHA1.hexdigest(digest)
        @error = true
        @error_text = "Digest Error"
      end      
    end
    
    if (!@error)
      @dim_user = DimUser.get_user_by_gc_id(params[:gc_id])
    end
    
    respond_to do |format|
      format.json do
        if @error
          render :json => {:error => true, :error_message => @error_text}
        else
          render :json => {
            :gc_id => @dim_user.gc_id,
            :score => @dim_user.score,
            :group => @dim_user.group
          }
        end
      end
    end
  end
  
  def reset_progress
    if !params[:gc_id]
      @error = true
      @error_text = "You need to supply the Game Center id by gc_id"
    else
      digest = '#DCFED#3di933' + params[:gc_id]
      if params[:dg] != Digest::SHA1.hexdigest(digest)
        @error = true
        @error_text = "Digest Error"
      end      
    end
    
    if (!@error)
      @dim_user = DimUser.get_user_by_gc_id(params[:gc_id])
      @dim_user.reset_progress
    end
    
    respond_to do |format|
      format.json do
        if @error
          render :json => {:error => true, :error_message => @error_text}
        else
          render :json => {
            :gc_id => @dim_user.gc_id,
            :score => @dim_user.score,
            :group => @dim_user.group
          }
        end
      end
    end
  end
  
  def end_match
    if !params[:match_id]
      @error = true
      @error_text = "You need to supply the Match id by match_id"
    elsif !params[:gc_id]
      @error = true
      @error_text = "You need to supply the Game Center id by gc_id"
    elsif !params[:other_id]
      @error = true
      @error_text = "You need to supply the other player's id by other_id"
    elsif !params[:match_result]
      @error = true
      @error_text = "You need to supply the match result by match_result (for the player with gc_id: 1000 means declined, 1001 means won, 1002 means lost)."
    else
      digest = params[:match_id] + 'AG($IAFKEAA)F#J' + params[:gc_id] + params[:other_id]
      if params[:dg] != Digest::SHA1.hexdigest(digest)
        @error = true
        @error_text = "Digest Error"
      end
    end
    
    
    if (!@error)
      @dim_user = DimUser.get_user_by_gc_id(params[:gc_id])
      if (params[:match_result].to_i == 1001)
        winner_id = params[:gc_id]
        loser_id = params[:other_id]
      else 
        winner_id = params[:other_id]
        loser_id = params[:gc_id]
      end
    
      winner_score = DimUser.get_user_by_gc_id(winner_id).score
      loser_score = DimUser.get_user_by_gc_id(loser_id).score
      
      begin
        @match = DimMatch.create({
          :match_id => params[:match_id],
          :winner_id => winner_id,
          :loser_id => loser_id,
          :winner_score => winner_score,
          :loser_score => loser_score
        })
        
        if params[:match_result].to_i == 1000
          @match.execute_declined
        else
          @match.execute
        end
      rescue ActiveRecord::StatementInvalid => exc
        @match = DimMatch.find_by_match_id(params[:match_id])
        if (@match == nil)
          @error = true
          @error_text = exc.message
        end
      end
    end
    
    if (!@error)
      @score_difference = @match.score_difference

      if @score_difference == nil
        @score_difference = 0
      end
       
      if (params[:gc_id] == @match.loser_id)
        @score_difference = -@score_difference
      end
    end
    
    respond_to do |format|
      format.json do
        if @error
          render :json => {:error => true, :error_message => @error_text}
        else
          @dim_user = DimUser.get_user_by_gc_id(params[:gc_id])
          render :json => {
            :gc_id => @dim_user.gc_id,
            :score => @dim_user.score,
            :group => @dim_user.group,
            :win_count => @dim_user.win_count,
            :score_difference => @score_difference
          }
        end
      end
    end
  end
  
  def group_for_score
    if !params[:gc_id]
      @error = true
      @error_text = "You need to supply the Game Center id by gc_id"
    elsif !params[:score]
      @error = true
      @error_text = "You need to supply the Score id by score"
    end
    
    
    if (!@error)
      dim_user = DimUser.get_user_by_gc_id(params[:gc_id])
      dim_user.score = params[:score]
      dim_user.save
    end
    
    respond_to do |format|
      format.json do
        if @error
          render :json => {:error => true, :error_message => @error_text}
        else
          render :json => {
            :gc_id => dim_user.gc_id,
            :score => dim_user.score,
            :group => dim_user.group
          }
        end
      end
    end
  end
end