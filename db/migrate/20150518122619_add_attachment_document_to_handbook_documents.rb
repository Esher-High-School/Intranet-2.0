class AddAttachmentDocumentToHandbookDocuments < ActiveRecord::Migration
  def self.up
    change_table :handbook_documents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :handbook_documents, :document
  end
end
