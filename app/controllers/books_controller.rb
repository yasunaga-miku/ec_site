class BooksController < ApplicationController
  #新規登録画面
  def new
    #新しい商品を作成するための空のインスタンスを用意
    @book = Book.new
  end

  #商品登録
  def create
    #フォームから送られたデータをもとに新しい商品を作成
    @book = Book.new(book_params)
    #データをデータベースに保存する
    if @book.save
      #成功した場合、書籍一覧へリダイレクト
      redirect_to books_path
    else
      #失敗した場合、入力内容を保持したままフォームを再表示
      render :new, status: :unprocessable_entity
    end
  end

  #書籍一覧画面
  def index
    @books = Book.all
  end

  #書籍詳細
  def show
    @book = Book.find(params[:id])
    @line_item = LineItem.new
  end

  #書籍編集
  def edit
    @book = Book.find(params[:id])
  end

  #書籍更新
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit
    end
  end

  #書籍削除
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    #書籍一覧にリダイレクト
    redirect_to books_path
  end

  private

  #ストロングパラメータで、フォームから送信されたデータを許可する
  def book_params
    params.require(:book).permit(:book_name, :author_name, :issue_date, :product_display, :price, :status, :photo)
  end

end
