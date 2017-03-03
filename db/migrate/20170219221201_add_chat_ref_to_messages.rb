class AddChatRefToMessages < ActiveRecord::Migration[5.0]
  def change
  			create_table :messges do |t|

    t.references :chat, foreign_key: true
  end
end
end
