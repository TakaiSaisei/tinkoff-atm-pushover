# frozen_string_literal: true

require './api/tinkoff_api'
require './models/tinkoff_atm'

class TinkoffService

  def get_atm(filter = nil)
    response = TinkoffApi.clusters(filter&.scope).body

    TinkoffAtm.new(response)
  end

end
