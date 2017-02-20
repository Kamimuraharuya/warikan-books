class CreateMessages < ActiveRecord::Migration[5.0]
	def change
		create_table :messages do |t|
			t.string :person_name
			t.text :body
			
			t.timestamps
		end
	end
end
