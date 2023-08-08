class ChangeValidColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :credit_cards, :valid, :valid_number
  end
end
