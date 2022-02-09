class RemoveIssueDateFromIssueBook < ActiveRecord::Migration[7.0]
  def change
    remove_column :issue_books, :issue_date
  end
end
