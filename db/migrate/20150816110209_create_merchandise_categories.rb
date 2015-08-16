class CreateMerchandiseCategories < ActiveRecord::Migration
  def change
    create_table :merchandise_categories do |t|
      t.integer :merchandise_id
      t.integer :category_id

      t.timestamps
    end
  end
end
