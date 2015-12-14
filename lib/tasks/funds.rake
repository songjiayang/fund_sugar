require_relative '../spider/funds_spider.rb'

namespace :funds do
  desc "batch load funds basic informations from sina api"
  task :batch_load => :environment do
    spider = FundsSpider.new
    funds_json = spider.body_object[:data]
    fund_columns = Fund.columns.map(&:name).map(&:to_sym)
    funds_json.each do |fund_attributes|
      fund = Fund.find_or_initialize_by(symbol: fund_attributes[:symbol])
      fund.assign_attributes(fund_attributes.slice(*fund_columns))
      fund.save
    end
  end
end
