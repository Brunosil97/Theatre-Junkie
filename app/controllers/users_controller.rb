class UsersController < ApplicationController

    def show 
        @user = User.find(params[:id])
    end 

    def new 
        @user = User.new
    end 

    def create
       
    end
    

    def edit 

    end 

    def update 

    end 

    private 

    def user_params
        params.require(:user).permit(:name, :email, :password_digest, :password_confirmation)
    end 
end
