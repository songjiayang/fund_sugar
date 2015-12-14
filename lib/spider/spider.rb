require 'mechanize'
require 'charlock_holmes'

class Spider
  def initialize(params={})
    @params = params
    @agent = Mechanize.new
    fetch
  end

  def fetch
    return @page if @page
    @page = @agent.get(page_url)
    detection = CharlockHolmes::EncodingDetector.detect(@page.body)
    @page.body = CharlockHolmes::Converter.convert @page.body, detection[:encoding], 'UTF-8'
    @page
  end

  alias_method :page, :fetch

  def body_object
    if jsonp?
      return @body_object if @body_object
      @body_object = eval(page.body.match(/\(\(.+\)\)/).to_s)
    end
    @body_object
  end

  private

  def jsonp?
    @page.uri.to_s.match('jsonp.php')
  end
end
