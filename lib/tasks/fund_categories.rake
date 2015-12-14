namespace :fund_categories do
  desc "batch load sina fund categories"
  task :batch_load => :environment do
    categories = eval(File.read(File.expand_path("../fund_categories.json", __FILE__)))
    categories.each do |category_attributes|
      category = FundCategory.find_or_initialize_by(name: category_attributes[:name])
      category.meta = category_attributes[:meta]
      category.save
      category_attributes[:sub_categories].each do |sub_category_attributes|
        sub_category = FundCategory.find_or_initialize_by(name: sub_category_attributes[:name])
        sub_category.meta = sub_category_attributes[:meta]
        sub_category.parent_id = category.id
        sub_category.save
      end
    end
  end

  desc "batch set fund's category"
  task :assign_to_fund => :environment do
    FundCategory.not_parent.each do |category|
      spider = FundsSpider.new({category: category})
      funds = spider.body_object[:data]
      symbols = funds.map { |fund| fund[:symbol].to_s }
      Fund.where(symbol: symbols).update_all({category_id: category.id})
    end
  end
end
