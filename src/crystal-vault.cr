require "./vault/*"

module Vault
  VERSION = "0.0.1"

  def self.client(
    host: String = "127.0.0.1"
    port: Int32 = 8200
    scheme: String = "http"
    token: String = ""
    ) : Vault::Client
    Vault::Client.new(host, port, scheme, token)
  end
end
