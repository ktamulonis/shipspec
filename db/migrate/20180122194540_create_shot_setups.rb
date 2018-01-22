class CreateShotSetups < ActiveRecord::Migration[5.1]
  def change
    create_table :shot_setups do |t|
      t.string :name
      t.string :angle
      t.text :hints

      t.timestamps
    end
  end
end
