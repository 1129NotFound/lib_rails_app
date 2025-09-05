# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    puts "jsalfuidsgkaiaoijgka"
    puts params.permit(:student_no, :name, :role, :password)[:student_no]
    @user = User.new(student_no: user_params[:student_no], name: user_params[:name], role: user_params[:role], password: user_params[:password])
    if @user.save
      redirect_to login_path, notice: "ユーザー登録が完了しました。ログインしてください。"
    else
      flash.now[:alert] = "ユーザー登録に失敗しました"
      render :new
    end
  end

  private

  def user_params
    params.permit(:student_no, :name, :role, :password)
  end
end
