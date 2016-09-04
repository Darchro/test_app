class Arts < ActiveRecord::Migration[5.0]
  def change
  	rename_column :articles, :cuser_id, :user_id
  end
end
