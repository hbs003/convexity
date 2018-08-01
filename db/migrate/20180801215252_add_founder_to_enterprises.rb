class AddFounderToEnterprises < ActiveRecord::Migration[5.2]
  def change
    add_reference :enterprises, :founder, foreign_key: true
  end
end
