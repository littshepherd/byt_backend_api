class UserController < ApplicationController
    def index 
        @users = User.all
        render :json => @users
    end

    def create
        puts params[:user]
        @user = User.new(user_params)
        @user.password = params[:password]
        if @user.save!
        render @user
      else
        render :new, status: :unprocessable_entity
      end
    end 


    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end