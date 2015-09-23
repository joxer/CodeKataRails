class UserActionController < ApplicationController


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
    session[:user] = nil
    user = User.where(:email => user_params[:email], :password => user_params[:password]).first

    if user != nil
      render :json => { :user => user}
    else
      render :json => { :error => "user is nil" }
    end
  end

 private

 def user_params
   params.require(:user).permit(:email, :password)
 end
end
