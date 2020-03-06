class UsersController < ApplicationController
    skip_before_action :authorize_user
    layout "login_signup"

    def show 
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new    
    end 

    def create
        @user = User.create(user_params)
        if  @user.save
            session[:user_id] = @user.id
            redirect_to controller: 'sessions', action: 'new'
        else  
            flash[:errors] = 'You can not create this user'
            redirect_to controller: 'users', action: 'new'
        end
    end

    def edit 

    end 

    def update 

    end 

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
