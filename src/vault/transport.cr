require "http/client"

module Vault
  class Transport
    getter client

    def initialize(@client : HTTP::Client)
    end

    def get(path : String) : HTTP::Client::Response
      resp = client.get(path)
      return resp
    end

    def post(path : String, payload : String) : HTTP::Client::Response
      resp = client.post(path, body: payload)
      return resp
    end

    def put(path : String, payload : String) : HTTP::Client::Response
      resp = client.put(path, body: payload)
      return resp
    end

    def delete(path : String) : HTTP::Client::Response
      resp = client.delete(path)
      return resp
    end
  end
end
