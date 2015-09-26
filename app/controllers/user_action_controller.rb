class UserActionController < ApplicationController
  before_filter :login_user, :only => [:create_concert]

  def create
    user = User.new(user_params)
    user.password = Digest::MD5.hexdigest(user.password)

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

  def create_user_token
    if login_user
      render :json => { :status => true, :user_token => UserToken.generate_user_token(@user) }
    else
      render :json => { :error => "user not exists" }
    end
  end


end
