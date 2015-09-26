class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
#  protect_from_forgery with: :exception

  unless Rails.application.config.consider_all_requests_local
    #rescue_from Exception, with: lambda { |exception| render_error 500, exception }
    rescue_from ActionController::RoutingError, ActionController::UnknownController, ::AbstractController::ActionNotFound, ActiveRecord::RecordNotFound, with: lambda { |exception| render_error 404, exception }
  end
  

private

  def render_error(status, exception)
    render json: {errors: "request not found" }
  end
  



  def login_user
    if @user == nil
      @user = User.where(:email => user_params[:email], :password => Digest::MD5.hexdigest(user_params[:password])).first
      if @user == nil
        @user_token = UserToken.where("token = ? AND start_date >= ? AND end_date >= ?", user_params[:token], user_params[:start_date], user_params[:end_date])
        if @user_token == []
          render :json => { :error => "user not exists" }
        else
          @user = @user_token.user
          @user
        end
      else
        @user
      end
    else
      @user
    end
  end

 def user_params
   params.require(:user).permit(:email, :password, :user_token)
 end

private
 def failed_user_json
   {status: :error, errors: "User is not owner or does not exists"}
 end

 def failed_user_not_admin_json
   {status: :error, errors: "You can't access this"}
 end
end
