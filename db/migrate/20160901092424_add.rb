class Add < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :comments_count, :string
  end
end
