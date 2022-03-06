require './credentials'
require 'httparty'

module PushoverApi
  extend self
  include HTTParty

  base_uri 'https://api.pushover.net/1/messages.json'

  def self.send(user, message)
    post '', { body: { token: Credentials::PUSHOVER_API_KEY, user: user, message: message } }
  end
end
