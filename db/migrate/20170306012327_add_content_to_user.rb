class AddContentToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :content, :string
  end
end
