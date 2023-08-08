class AddLimitToCreditCards < ActiveRecord::Migration[7.0]
  def change
    add_column :credit_cards, :limit, :bigint
  end
end
