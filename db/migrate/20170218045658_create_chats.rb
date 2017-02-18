class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.integer :chat_id

      t.timestamps
    end
  end
end
