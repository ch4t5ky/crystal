require "http/client"

module Vault
  class Transport
    getter client

    def initialize(@client: HTTP::Client)
    end

    def get(path : String) : HTTP::Client::Response
      resp = client.get(path)
      return resp
    end

    def post(path : String, payload : JSON:Any) : HTTP::Client::Response
      resp.post(path, body: data)
      return resp
    end

    def put(path : String, payload : JSON:Any) : HTTP::Client::Response
      resp.post(path, body: data)
      return resp
    end

    def delete(path : String) : HTTP::Client::Response
      resp = client.delete(path)
      return resp
    end
  end
end
