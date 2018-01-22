class AddAttachmentClockToShotSetups < ActiveRecord::Migration[5.1]
  def self.up
    change_table :shot_setups do |t|
      t.attachment :clock
    end
  end

  def self.down
    remove_attachment :shot_setups, :clock
  end
end
