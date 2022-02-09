class BooksController < ApplicationController
  before_action :set_page, only: [:index]
  def index
    if params[:name]
    @books = Book.where("name ilike ?", "%#{params[:name]}%")
    else
    @books = Book.all.order(created_at: :desc).limit(5).offset(@page * 5)
    end
  end

  def new
    @action ='new'
    @book = Book.new
  end

  def create 
    @book = Book.new(b_params)
    if @book.present?
      @book.update(deleted:false)
    else
      @book.save
    end
    redirect_to root_path notice: "Books added Successfully"
  end

  def edit
    @action ='edit'
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(b_params) 
      redirect_to root_path, notice: "Book is Updated Successfully"
    else
      render 'edit'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    
    @book.update(deleted: true)

    redirect_to root_path, notice: "Book is Deleted Successfully"
  end

  private
  def b_params
    params.require(:book).permit(:id, :name, :price, :content, :author, :genre, :description, :image)
  end
  private
  def set_page
    @page = params[:page].to_i || 0
  end
end
