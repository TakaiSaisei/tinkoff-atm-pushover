require './tinkoff_service'
require './tinkoff_atm_filter'

BOTTOM_LEFT = { lat: 55.56727024240635, lng: 37.56896544957144 }
TOP_RIGHT = { lat: 55.56741881152076, lng: 37.569773465037166 }

filter = TinkoffAtmFilter.new

filter_params = filter.geo(bottom_left: BOTTOM_LEFT, top_right: TOP_RIGHT)
                      .show_unavailable(true)
                      .banks(['tcs'])
                      .currencies(['RUB'])
                      .zoom(21)

interval = 300

while true do
  atm = TinkoffService.new.get_atm(filter_params)

  if atm.usd_available?
    message = "USD available at Grina st. ATM! Amount of USD: #{atm.usd_amount}, time: #{Time.now.strftime('%H:%M:%S')}"
    PushoverApi.send(Credentials::PUSHOVER_MY_APP, message)
    break
  else
    message = "No USD available, time: #{Time.now.strftime('%H:%M:%S')}"
    puts message
  end

  sleep interval
end
