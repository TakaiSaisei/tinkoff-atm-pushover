# frozen_string_literal: true

require './services/tinkoff_service'
require './services/pushover_service'
require './services/tinkoff_atm_filter'

BOTTOM_LEFT = { lat: 55.56727024240635, lng: 37.56896544957144 }.freeze
TOP_RIGHT = { lat: 55.56741881152076, lng: 37.569773465037166 }.freeze

filter_params = TinkoffAtmFilter.new
                                .geo(bottom_left: BOTTOM_LEFT, top_right: TOP_RIGHT)
                                .show_unavailable(true)
                                .banks(['tcs'])
                                .currencies(['RUB'])
                                .zoom(21)
tinkoff_service = TinkoffService.new
pushover_service = PushoverService.new

interval = 60

loop do
  atm = tinkoff_service.get_atm(filter_params)

  if atm.usd_available?
    message = "USD available at Grina st. ATM! Amount of USD: #{atm.usd_amount}, time: #{Time.now.strftime('%H:%M')}"
    pushover_service.send(message)
    puts message
    break
  else
    message = "No USD available, time: #{Time.now.strftime('%H:%M')}"
    puts message
  end

  sleep interval
end
