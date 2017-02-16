class AddDetailsToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :area, :string
    add_column :microposts, :day, :integer
    add_column :microposts, :kakikomi, :string
    add_column :microposts, :bookprice, :integer
    add_column :microposts, :bookname, :string
  end
end
