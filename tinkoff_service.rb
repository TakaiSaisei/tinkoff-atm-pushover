require './api/pushover_api'
require './api/tinkoff_api'
require './tinkoff_atm'

class TinkoffService
  def get_atm(filter = nil)
    response = TinkoffApi.clusters(filter&.scope).body

    TinkoffAtm.new(response)
  end
end
