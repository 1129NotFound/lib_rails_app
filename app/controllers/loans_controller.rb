class LoansController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @book = Book.find(params[:book_id])
      @user = current_user
  
      # すでに借りているかチェック
      if @user.books.include?(@book)
        flash[:alert] = "この本はすでに借りています"
        redirect_to books_path
        return
      end
  
      # 貸出処理
      @loan = Loan.new(
        user: @user,
        book: @book,
        borrowed_at: Time.current,
        due_at: 1.month.from_now
      )
  
      if @loan.save
        flash[:notice] = "本を借りる手続きが完了しました"
        redirect_to books_path
      else
        flash[:alert] = "貸出に失敗しました"
        redirect_to books_path
      end
    end

    def return_book
        @loan = Loan.find_by(user_id: current_user.id, book_id: params[:book_id])
      
        if @loan
          @loan.update(returned_at: Time.current)
          flash[:notice] = "本を返却しました"
        else
          flash[:alert] = "この本は借りていません"
        end
      
        redirect_to dashboard_path
      end
      
  end
  