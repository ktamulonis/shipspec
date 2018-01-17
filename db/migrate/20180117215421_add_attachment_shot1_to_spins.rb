class AddAttachmentShot1ToSpins < ActiveRecord::Migration[5.1]
  def self.up
    change_table :spins do |t|
      t.attachment :shot1
    end
  end

  def self.down
    remove_attachment :spins, :shot1
  end
end
