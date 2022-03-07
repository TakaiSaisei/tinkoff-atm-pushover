# frozen_string_literal: true

require './credentials'
require 'httparty'

module PushoverApi
  module_function

  include HTTParty

  base_uri 'https://api.pushover.net/1/messages.json'

  def send(user, message)
    post '', { body: { token: Credentials::PUSHOVER_API_KEY, user: user, message: message } }
  end

end
