class AddPhotoToEnterprises < ActiveRecord::Migration[5.2]
  def change
    add_column :enterprises, :photo, :string
  end
end
