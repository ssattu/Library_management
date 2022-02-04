class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :is_admin, :boolean, default:false
    add_column :users, :avtar, :string    
    add_column :users, :contact, :string
  end
end
