class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception

private

  def login_user
    @user = User.where(:email => user_params[:email], :password => user_params[:password]).first
    unless @user.valid? 
      render :json => { :error => "user not exists" }
    end
  end

 def user_params
   params.require(:user).permit(:email, :password)
 end


end
