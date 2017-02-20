class RemoveChatIdFromChats < ActiveRecord::Migration[5.0]
  def change
    remove_column :chats, :chat_id, :string
  end
end
