class AddAttachmentAttachmentToPageAttachments < ActiveRecord::Migration
  def self.up
    change_table :page_attachments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :page_attachments, :attachment
  end
end
