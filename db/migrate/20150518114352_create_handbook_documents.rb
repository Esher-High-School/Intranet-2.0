class CreateHandbookDocuments < ActiveRecord::Migration
  def change
    create_table :handbook_documents do |t|
      t.string :title
      t.integer :category_id
      t.string :slug

      t.timestamps null: false
    end
    add_index :handbook_documents, :slug, unique: true
  end
end
