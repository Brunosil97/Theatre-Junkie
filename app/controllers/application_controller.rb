class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorize_user
    before_action :set_user
    helper_method :logged_in?

    def set_user
        @user = logged_in? ? User.find(session[:user_id]) : nil
    end

    def logged_in?
        !!session[:user_id]
    end

    def authorize_user
        if !logged_in?
            redirect_to login_path
        end
    end
end
