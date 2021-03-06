class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin
      t.boolean :publisher
      t.string :slug

      t.timestamps null: false
    end
    add_index :users, :slug, unique: true
  end
end
