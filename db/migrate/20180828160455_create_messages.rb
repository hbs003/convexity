class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :body

      t.timestamps
    end
  end
end
