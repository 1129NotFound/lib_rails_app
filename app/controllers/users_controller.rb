class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.password == 
        redirect_to books_path
      else
        render :new
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:student_no, :name, :role, :password)
    end
  end
  