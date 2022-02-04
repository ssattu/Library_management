class CreateIssueBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :period_of_days
      t.datetime :issue_date

      t.timestamps
    end
  end
end
