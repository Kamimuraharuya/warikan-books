class AddDetailsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_book, :string
    add_column :users, :university, :string
    add_column :users, :major, :string
  end
end
