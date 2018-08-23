class AddQualifiedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :qualified, :boolean, null: false, default: false
  end
end
