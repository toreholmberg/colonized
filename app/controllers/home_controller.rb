class HomeController < ApplicationController
  
  def index
  end

  def check_user
    if user_signed_in?
      render :json => { :user => { :id => current_user.id.to_s } }
    else
      render :json => { :error => { :message => "No session" } }
    end
  end
end