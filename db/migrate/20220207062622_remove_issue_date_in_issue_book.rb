class RemoveIssueDateInIssueBook < ActiveRecord::Migration[7.0]
  def change
    change_table :issue_books do |t|
      t.change :issue_date, :datetime, default: Date.current
    end
  end
end
