class AddSlugToHandbookCategories < ActiveRecord::Migration
  def change
    add_column :handbook_categories, :slug, :string
    add_index :handbook_categories, :slug, unique: true
  end
end
