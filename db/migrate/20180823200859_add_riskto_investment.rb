class AddRisktoInvestment < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :risk, :boolean, null: false, default: false
  end
end
