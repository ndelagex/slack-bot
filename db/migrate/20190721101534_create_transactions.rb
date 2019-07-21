class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :value
      t.string :currency
      t.references :from
      t.references :to

      t.timestamps
    end

    add_foreign_key :transactions, :users, column: :from_id, primary_key: :id
    add_foreign_key :transactions, :users, column: :to_id, primary_key: :id
  end
end
