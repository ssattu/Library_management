class AddColumnToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :deleted, :boolean, default:false
  end
end
