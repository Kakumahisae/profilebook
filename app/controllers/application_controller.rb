class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user || User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  ###########アクセス制限 仮 ########
  private
    def logged_in_user
      unless logged_in?
        redirect_to login_url
        flash[:info] = "ログインして下さい"
      end
    end
    
    
end
