require "../transport"

module Vault
  class Audit < Vault::Transport
    PATH = "/v1/sys/audit"

    def get_enabled_audit_devices : String
      resp = get(PATH)
      return resp.body
    end
  end
end
