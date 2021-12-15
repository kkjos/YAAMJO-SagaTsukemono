class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.string :image_id, null:false
      t.text :introduction, null:false
      t.string :capacity, null:false
      t.integer :price, null:false
      t.boolean :is_active, null:false, default: true
      t.timestamps
    end
  end
end
