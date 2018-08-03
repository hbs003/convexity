class AddContactToEnterprises < ActiveRecord::Migration[5.2]
  def change
    add_column :enterprises, :contact, :string
    add_column :enterprises, :phone, :string
    add_column :enterprises, :website, :string
  end
end
