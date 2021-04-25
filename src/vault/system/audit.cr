require "../transport"
require "json"
module Vault
  class Audit < Vault::Transport
    PATH = "/v1/sys/audit"

    def get_enabled_audit_devices : String
      resp = get(PATH)
      return resp.body
    end

    def enable_audit_device(path : String, description : String, options : String, device_type : String) : Int32
      payload = JSON.build do |json|
        json.object do
            json.field "type", device_type
            json.field "description", description
            json.field "options", JSON.parse(options)
        end
      end
      resp = put("#{PATH}/#{path}", payload)
      return resp.status_code
    end

    def disable_audit_device(path : String) : Int32
      resp = delete("#{PATH}/#{path}")
      return resp.status_code
    end

  end
end
