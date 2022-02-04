class CreateReturnBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :return_books do |t|
      t.references :issue_book, null: false, foreign_key: true
      t.string :return_date

      t.timestamps
    end
  end
end
