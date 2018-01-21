class AddAttachmentPictureToShots < ActiveRecord::Migration[5.1]
  def self.up
    change_table :shots do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :shots, :picture
  end
end
