class AddAuthorToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :author, :string
    add_column :posts, :date, :string
    add_column :posts, :call, :string
    add_column :posts, :photo, :string
  end
end
