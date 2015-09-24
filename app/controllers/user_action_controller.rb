class UserActionController < ApplicationController
  before_filter :login_user, :only => [:create_concert]

  def create
    user = User.new(user_params)
    user.role = Role.where(:role => "user").first
    if user.save
      render :json => { :status => true }    
    else
      render :json => { :error => user.errors, :status => false}
    end
  end


  def login
    if  login_user
      render :json => { :status => true, :message => "logged in"}
    else
      render :json => { :error => "user not exists" }
    end
  end


end
