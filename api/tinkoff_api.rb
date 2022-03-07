# frozen_string_literal: true

# Example of request body
# { bounds: { bottomLeft: { lat: 55.56727024240635, lng: 37.56896544957144 },
#             topRight: { lat: 55.56741881152076, lng: 37.569773465037166 } },
#   filters: { banks: ['tcs'], showUnavailable: true, currencies: ["RUB"] },
#   zoom: 21 }

require 'httparty'

module TinkoffApi
  module_function

  include HTTParty

  base_uri 'https://api.tinkoff.ru/'
  headers 'Content-Type': 'application/json'

  def clusters(body)
    post '/geo/withdraw/clusters', { body: body.to_json }
  end

end
