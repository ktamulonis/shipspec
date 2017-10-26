class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :email
      t.string :mc_number
      t.string :dot_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
