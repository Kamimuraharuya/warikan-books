class AddDetailsToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :body, :text
    add_column :chats, :person_name, :string
  end
end
