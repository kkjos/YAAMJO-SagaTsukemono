class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, nill:false
      t.string :image_id, nill:false
      t.text :introduction, nill:false
      t.integer :price, nill:false
      t.boolean :is_active, nill:false, default: true
      t.timestamps
    end
  end
end
