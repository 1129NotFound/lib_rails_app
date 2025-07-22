class UserController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.save(user_params)
        if @user.save
            reser_session
            log_in @user
            flash[:success] = "Welcome to the Sample App!"
            redirect_to @user
        else
            render 'new' , status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confermation)
    end
end
