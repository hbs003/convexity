class AddEnterpriseToFounders < ActiveRecord::Migration[5.2]
  def change
    add_reference :founders, :enterprise, foreign_key: true
  end
end
