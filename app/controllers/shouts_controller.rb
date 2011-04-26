class ShoutsController < ApplicationController
  before_filter :authorize
  
  def index
    @shouts = Shout.most_recent
    @shout = Shout.new
  end
  
  def destroy
    shout = Shout.find(params[:id])
    shout.destroy
    flash[:delete] = "Shout deleted."
    redirect_to root_path
  end
  
  def create
    @shout      = Shout.new(params[:shout])
    @shout.user = current_user
    if @shout.save
      flash[:success] = "Shout created!"
    else
      flash[:failure] = "Shout can't be blank."
    end
    redirect_to root_path
  end
end
