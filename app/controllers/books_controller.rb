class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]

  # GET /books
  def index
    books = User.find(params[:user_id]).books.map do | book |
      {
        id: book.id,
        title: book.title,
        author: book.author,
        genre: book.genre,
        current_chapter: book.current_chapter,
        total_chapters: book.total_chapters
      }
    end

    render json: { status: "success", data: books, message: "Books loaded successfull " }, status: :ok
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    book = Book.new(book_params)

    if book.save
      render json: { status: "success", data: book, message: "Book created successfully" }, status: :created
    else
      render json: { status: "error", data: book.errors, message: "Book not created" }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: { status: "success", data: @book, message: "Book updated successfully" }, status: :ok
    else
      render json: { status: "error", data: @book.errors, message: "Book not updated" }, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy!
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:user_id, :author, :title, :genre, :current_chapter, :total_chapters)
    end
end
