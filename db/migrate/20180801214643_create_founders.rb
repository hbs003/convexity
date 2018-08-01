class CreateFounders < ActiveRecord::Migration[5.2]
  def change
    create_table :founders do |t|
      t.string :name
      t.text :description
      t.string :function

      t.timestamps
    end
  end
end
