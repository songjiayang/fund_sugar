namespace :fund_filters do
  desc 'filter all funds with 4433'
  task '4433' do
    hited_funds = []
    Fund.group(:category_id).count.each do |category_id, count|
      next unless category_id
      from_start_funds = Fund.where(category_id: category_id).order('form_start desc').pluck(:symbol).first(count/4)
      one_year_funds = Fund.where(category_id: category_id).order('one_year desc').pluck(:symbol).first(count/4)
      six_month_funds = Fund.where(category_id: category_id).order('six_month desc').pluck(:symbol).first(count/3)
      three_month_funds = Fund.where(category_id: category_id).order('three_month desc').pluck(:symbol).first(count/3)
      hited_funds += from_start_funds.select { |fund| one_year_funds.include?(fund) && six_month_funds.include?(fund) && three_month_funds.include?(fund)}
    end
    hited_funds =  Fund.where(symbol: hited_funds).where('clrq < ?', 3.years.ago).pluck(:symbol)
    p hited_funds
  end
end
