class BooksController < ApplicationController
  def index
    @books = Book.all
    
  end

  def new
    @book = Book.new #空のインスタンスを生成
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def create
    @book = Book.new(book_params) #データを新規登録するためのインスタンス生成
    @book.save #データをデータベースに保存するためのsaveメソッド実行
    redirect_to action: 'index' #トップ画面へリダイレクト
  end
  
  private
    def book_params #ストロングパラメータ
      params.require(:book).permit(:title, :body) #パラメーターのキー
    end
end
