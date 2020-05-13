class SessionsController < ApplicationController
    skip_before_action :authorize_user
    layout "login_signup"
    
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to "/events"
        else
            flash[:errors] = 'Login details are incorrect'
            redirect_to(controller: 'sessions', action: 'new')
        end
    end

    def destroy
        session.delete :user_id
        flash[:notice] = 'logged out successfully'

        redirect_to '/', method: :get
    end
end
