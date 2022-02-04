class CreateIssuedBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :issued_books do |t|
      t.references :issue_book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.string :fine

      t.timestamps
    end
  end
end
