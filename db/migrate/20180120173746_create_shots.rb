class CreateShots < ActiveRecord::Migration[5.1]
  def change
    create_table :shots do |t|
      t.references :spin, foreign_key: true

      t.timestamps
    end
  end
end
