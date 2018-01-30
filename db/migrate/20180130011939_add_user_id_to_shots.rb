class AddUserIdToShots < ActiveRecord::Migration[5.1]
  def change
    add_column :shots, :user_id, :integer
  end
end
