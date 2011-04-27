class ShoutsController < ApplicationController
  before_filter :authorize, :except => [:index]
  
  def index
    @shouts = Shout.most_recent
    @shout = Shout.new
    if current_user != nil
      @signed_in = true
    elsif
      @signed_in = false
    end
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
