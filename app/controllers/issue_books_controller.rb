class IssueBooksController < ApplicationController
  def index
    @issue_books = IssueBook.all
  end

  def new
    @action ='new'
    @issue_book = IssueBook.new
  end

  def create 
    @issue_book = current_user.issue_books.new(b_params)
    # debugger
    @issue_book.save

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
    @issue_book = IssueBook.find(params[:id])
    @issue_book.destroy

    redirect_to issue_books_path, notice: "issueBook is Deleted Successfully"
  end

  private
  def b_params
    params.require(:issue_book).permit(:book_id, :user_id, :period_of_days, :issue_date)
  end
end
