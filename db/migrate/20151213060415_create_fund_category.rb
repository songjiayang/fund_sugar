class CreateFundCategory < ActiveRecord::Migration
  def change
    create_table :fund_categories do |t|
      t.string :name, null: false, unique: true
      t.integer :parent_id
      t.text :meta
      t.timestamps null: false
    end

    add_index :fund_categories, :name, unique: true
  end
end
