require 'duration'
require 'httpclient'

module Clowder
  CLOWDER_ROOT_URL = 'http://www.clowder.io'
  CLOWDER_API_URL = CLOWDER_ROOT_URL + '/api'

  class Client
    attr_reader :api_key

    def initialize(api_key)
      @api_key = api_key
    end

    def ok(data)
      if data.has_key? :status
        raise ArgumentError, "Status should not be provided in ok"
      end

      data[:status] = 1

      send(data)
    end

    def fail(data)
      if data.has_key? :status
        raise ArgumentError, "Status should not be provided in fail"
      end

      data[:status] = -1

      send(data)
    end

    def send(data)
      url = data.fetch("url", CLOWDER_API_URL)

      data[:api_key] = @api_key

      if not data.has_key? :value
        data[:value] = data.fetch(:status, 1)
      end

      if data.has_key? :frequency
        data[:frequency] = frequency_to_seconds(data[:frequency])
      end

      HTTPClient.post url, body: data
    end

    def frequency_to_seconds(freq)
      if freq.instance_of? Duration
        return freq.total
      elsif freq.instance_of? String
        return freq.to_i
      end

      return freq
    end
  end
end
