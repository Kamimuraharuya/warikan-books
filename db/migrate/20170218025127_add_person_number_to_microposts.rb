class AddPersonNumberToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :person_number, :integer
  end
end
