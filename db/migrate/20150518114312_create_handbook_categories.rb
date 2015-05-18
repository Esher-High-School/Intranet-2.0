class CreateHandbookCategories < ActiveRecord::Migration
  def change
    create_table :handbook_categories do |t|
      t.string :title
      t.timestamps null: false
    end
  end
end
