class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.create user_params
        render json: @user
    end

    def update
        @user = User.update update_params
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :email)
    end

    def update_params
        params.require(:user).permit(:username, :password_digest, :email, :avatar, :twitter, :dob, :about, :name, :city, :state)
    end
    
end
