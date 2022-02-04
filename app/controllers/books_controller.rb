class BooksController < ApplicationController
  def index
    if params[:name]
    @books = Book.where("name ilike ?", "%#{params[:name]}%")
    else
    @books = Book.all.order(:name)
    end
  end

  def new
    @action ='new'
    @book = Book.new
  end

  def create 
    @book = Book.new(b_params)
    # debugger
    @book.save

    redirect_to root_path notice: "Books added Successfully"
  end

  def edit
    @action ='edit'
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    
    if @book.update(posts_params) 
      redirect_to root_path, notice: "Post is Updated Successfully"
    else
      render 'edit'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path, notice: "Book is Deleted Successfully"
  end

  private
  def b_params
    params.require(:book).permit(:id, :name, :price, :genre, :description, :image)
  end

end
