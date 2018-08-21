class CreateInvestments < ActiveRecord::Migration[5.2]
  def change
    create_table :investments do |t|
      t.integer :amount
      t.boolean :available
      t.references :user
      t.references :offer
      t.string :status

      t.timestamps
    end
  end
end
