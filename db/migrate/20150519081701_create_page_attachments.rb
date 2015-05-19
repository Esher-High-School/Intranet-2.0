class CreatePageAttachments < ActiveRecord::Migration
  def change
    create_table :page_attachments do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
