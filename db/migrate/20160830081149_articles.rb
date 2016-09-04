class Articles < ActiveRecord::Migration[5.0]
  def change
  	create_table :articles do |t|
  		t.string :title
  		t.string :content
  		t.references :cuser
  		t.references :category

  		t.timestamps
  	end
  end
end
