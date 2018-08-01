class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :enterprise
      t.string :content
      t.string :title

      t.timestamps
    end
  end
end
