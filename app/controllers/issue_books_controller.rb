class IssueBooksController < ApplicationController
  def index
    @issue_books = IssueBook.all
  end

  def return_book
    @issue_books = IssueBook.all
  end

  def new
    # @action ='new'
    # debugger
    @issue_book = IssueBook.new
    @book = Book.find(params[:id])
  end

  def create 
    # debugger
    @issue_book = current_user.issue_books.new(b_params)
    if @issue_book.present?
      @issue_book.update(returned:false)
    else
      @issue_book.save
    end

    redirect_to issue_books_path notice: "Book Issued Successfully"
  end

  def edit
    @action ='edit'
    @issue_book = IssueBook.find(params[:id])

  end

  def update
    @issue_book = IssueBook.find(params[:id])
    
    if @issue_book.update(b_params) 
      redirect_to issue_books_path, notice: "Book is returned Successfully"
    else
      render 'edit'
    end
  end

  def show
    @issue_book = IssueBook.find(params[:id])
  end

  def destroy
    # debugger
    @issue_book = IssueBook.find(params[:id])
    @issue_book.update(returned:true)

    redirect_to issue_books_path, notice: "IssueBook is Returned Successfully"
  end

  private
  def b_params
    params.require(:issue_book).permit(:book_id, :user_id, :book_id, :created)
  end
end
