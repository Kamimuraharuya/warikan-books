class AddIndexToUsersEmail < ActiveRecord::Migration[5.0]
  def change
  	    add_index :users, :email, unique: true 
  	    #メールアドレスの一意性を強制するためにindexを追加、全表すキャンせんで良くなる
 
  end
end
