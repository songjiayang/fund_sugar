require_relative './spider'

class FundsSpider < Spider

  private

  def page_url
    url = "http://vip.stock.finance.sina.com.cn/fund_center/data/jsonp.php/IO.XSRV2.CallbackList['hLfu5s99aaIUp7D4']/NetValueReturn_Service.NetValueReturnOpen?page=1&num=10000&"
    if category = @params[:category]
      url += category.meta.to_a.map { |param| param.join('=') }.join('&')
    end
    url
  end

end
