# frozen_string_literal: true

require './api/pushover_api'

class PushoverService

  def send(message)
    PushoverApi.send(Credentials::PUSHOVER_MY_APP, message)
  end

end
