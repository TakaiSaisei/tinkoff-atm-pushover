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
