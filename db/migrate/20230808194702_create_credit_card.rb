class CreateCreditCard < ActiveRecord::Migration[7.0]
  def change
    create_table :credit_cards do |t|
      t.bigint :number
      t.boolean :valid

      t.timestamps
    end
  end
end
