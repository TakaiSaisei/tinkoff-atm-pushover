# Example of request body
=begin
  { bounds: { bottomLeft: { lat: 55.56727024240635, lng: 37.56896544957144 },
              topRight: { lat: 55.56741881152076, lng: 37.569773465037166 } },
    filters: { banks: ['tcs'], showUnavailable: true, currencies: ["RUB"] },
    zoom: 21 }
=end

require 'httparty'

module TinkoffApi
  extend self
  include HTTParty

  base_uri 'https://api.tinkoff.ru/'
  headers 'Content-Type': 'application/json'

  def self.clusters(body)
    post '/geo/withdraw/clusters', { body: body.to_json }
  end
end
