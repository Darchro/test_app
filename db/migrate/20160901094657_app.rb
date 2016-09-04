class App < ActiveRecord::Migration[5.0]
  def change
  	change_table :articles do |t|
  		t.remove :comments_count
  		t.integer :comments_count
  	end
  end
end
