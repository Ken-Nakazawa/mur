RakutenWebService.configuration do |c|
  c.application_id = ENV['RAKUTEN_KEY']
  c.affiliate_id = ENV['RAKUTEN_AFFILIATEID']#任意

  c.max_retries = 5 # default: 5
  c.debug = true # default: false
end
