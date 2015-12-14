class AddCategoryIdToFund < ActiveRecord::Migration
  def change
    add_column :funds, :category_id, :integer
    add_index :funds, :category_id
  end
end
