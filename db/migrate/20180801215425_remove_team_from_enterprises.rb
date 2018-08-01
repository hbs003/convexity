class RemoveTeamFromEnterprises < ActiveRecord::Migration[5.2]
  def change
    remove_column :enterprises, :team, :string
  end
end
