class AddDepositToInvestment < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :deposit, :string
  end
end
