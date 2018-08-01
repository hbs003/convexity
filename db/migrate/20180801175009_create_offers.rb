class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.text :description
      t.float :share
      t.integer :pu
      t.integer :units
      t.string :final_date
      t.references :enterprise

      t.timestamps
    end
  end
end
