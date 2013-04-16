class DimController < ApplicationController
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