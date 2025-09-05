class SessionsController < ApplicationController
    def new
      # ログインフォーム表示
    end
  
    def create
      user = User.find_by(student_no: params[:student_no])
      if user&.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to books_path, notice: "ログイン成功！"
      else
        flash.now[:alert] = "学籍番号かパスワードが間違っています"
        render :new
      end
    end
  
    def destroy
      session.delete(:user_id)
      redirect_to login_path, notice: "ログアウトしました"
    end
  end
  