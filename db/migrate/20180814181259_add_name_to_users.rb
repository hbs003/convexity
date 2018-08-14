class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :cpf, :string
    add_column :users, :address, :string
  end
end
