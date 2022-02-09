class ChangeIssueDateInIssueBook < ActiveRecord::Migration[7.0]
  def change
    change_table :issue_books do |t|
      t.change :issue_date, :datetime, default: Time.now
    end
  end
end
