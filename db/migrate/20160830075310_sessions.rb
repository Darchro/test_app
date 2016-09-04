class Sessions < ActiveRecord::Migration[5.0]
  def change
  	create_table :sessions do |t|
    	t.string :name
    	t.string :password_digest

      t.timestamps
    end
  end
end
