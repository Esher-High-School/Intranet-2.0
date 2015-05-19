class AddPageIdToPageAttachments < ActiveRecord::Migration
  def change
    add_column :page_attachments, :page_id, :integer
  end
end
