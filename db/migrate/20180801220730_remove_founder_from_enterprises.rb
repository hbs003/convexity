class RemoveFounderFromEnterprises < ActiveRecord::Migration[5.2]
  def change
    remove_reference :enterprises, :founder, foreign_key: true
  end
end
