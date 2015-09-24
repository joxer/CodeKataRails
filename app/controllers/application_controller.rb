class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception

private

  def login_user
    @user = User.where(:email => user_params[:email], :password => Digest::MD5.hexdigest(user_params[:password])).first
    if @user == nil
      render :json => { :error => "user not exists" }
    end
  end

 def user_params
   params.require(:user).permit(:email, :password)
 end

private
 def failed_user_json
   {status: :error, errors: "User is not owner or does not exists"}
 end

 def failed_user_not_admin_json
   {status: :error, errors: "You can't access this"}
 end
end
