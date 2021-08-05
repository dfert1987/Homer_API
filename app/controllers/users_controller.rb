class UsersController < ApplicationController
    skip_before_action :authenticate, only: [:create, :index, :login, :update]

    def index
        @users = User.all
        render json: @users  
    end

    def create
        @user = User.create user_params
        render json: @user
    end

    def profile
        render json: @user
    end

    def login 
        @user = User.find_by username: params[:user][:username]

        if !@user
            render json: { error: "No User."}, status: :unauthorized
        else
            if !@user.authenticate params[:user][:password]
                render json: { error: "Wrong username or password."}, status: :unauthorized
            else
               payload = { user_id: @user.id } 
               secret = 'Secret shit'

               token = JWT.encode  payload, secret

               render json: { token: token, user: @user }, status: :ok
            end
        end
    end

    def update
        @user = User.update update_params
        render json: @user
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end

    def update_params
        params.require(:user).permit(:username, :password_digest, :email, :avatar, :twitter, :dob, :about, :name, :city, :state)
    end
end
