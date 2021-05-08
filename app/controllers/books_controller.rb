class BooksController < ApplicationController
  def index
    @books = Book.all
    @booknew = Book.new
    @user = current_user
  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @user = current_user
    
  end

  def edit
  end

  def create
    @booknew = Book.new(book_params) #データを新規登録するためのインスタンス生成
    @user = current_user
    @booknew.user_id = current_user.id
    if @booknew.save #データをデータベースに保存するためのsaveメソッド実行
      redirect_to book_path(@booknew.id),notice: 'Book was succesfully created'
    else
      @books = Book.all
    redirect_to action: 'index' #トップ画面へリダイレクト
  end
end

  
  private
    def book_params #ストロングパラメータ
      params.require(:book).permit(:title, :body) #パラメーターのキー
    end
end
