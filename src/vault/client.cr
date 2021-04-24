require "json"
require "http/client"
require "uri"

module Vault
  class Client
    getter host, port, scheme, token, consistency

    def initialize(
      @host: String = "127.0.0.1"
      @port: Int32 = 8200
      @scheme: String = "http"
      @token: String = ""
      )

      client = http_client_object("#{scheme}://#{host}:#{port}", token)

    end
    private def http_client_object(uri : String, token : String? = nil): HTTP::Client
      uri = URI.parse(uri)
      client = HTTP::Client.new(uri)
      client.connect_timeout = 5

      unless token==""
        client.before_request do |request|
          request.headers["X-Vault-Token"] = token
        end
      end

      return client
    end
  end
end
