class CreateMerchandises < ActiveRecord::Migration
  def change
    create_table :merchandises do |t|
      t.string :name
      t.decimal :retail_price
      t.decimal :buy_price
      t.text :description
      t.integer :number_available

      t.timestamps
    end
  end
end
