class CreateFundsTable < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      # funds basic information
      t.string :symbol, null: false, unique: true
      t.string :name, null: false
      t.string :sname, null: false # 基金新浪名称

      # funds statistics Information
      t.float :three_month
      t.float :six_month
      t.float :one_year
      t.float :form_year
      t.float :form_start
      t.datetime :jzrq

      # funds additional information
      t.string :jjglr_code # 基金公司新浪编码
      t.datetime :clrq # 基金成立日期

      t.timestamps null: false
    end
  end
end
