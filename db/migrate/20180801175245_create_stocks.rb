class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :user
      t.references :enterprise

      t.timestamps
    end
  end
end
