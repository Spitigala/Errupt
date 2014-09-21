class AddAttachmentImageToErrorlogs < ActiveRecord::Migration
  def self.up
    change_table :errorlogs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :errorlogs, :image
  end
end
