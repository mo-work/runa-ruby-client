# frozen_string_literal: true

require 'faraday'
require 'faraday/follow_redirects'
require 'uri'

module Runa
  class RemoteCode < Response
    attr_accessor :url

    # response/success
    attr_accessor :amount, :barcode_format, :barcode_string, :code, :expiry_date,
                  :pin, :type

    def get(_ctx)
      conn = Faraday.new(url: url) do |c|
        c.response :follow_redirects, limit: 5
        c.adapter :net_http
      end
      parse(conn.get("#{url}?format=json") { |r| r.headers['Accept'] = 'application/json' })
    end

    def parse(response)
      super

      if is_successful?
        self.class.new(@payload['e_code'])
      else
        self
      end
    end
  end
end
