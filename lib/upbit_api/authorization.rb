require 'jwt'

module UpbitApi
  # Authorization
  class Authorization
    attr_accessor :access_key, :secret_key

    def initialize(access_key, secret_key)
      self.access_key = access_key
      self.secret_key = secret_key
    end

    def sign(query = nil)
      payload = if query.nil?
                  {
                    access_key: @access_key,
                    nonce: nonce
                  }
                else
                  {
                    access_key: @access_key,
                    nonce: nonce,
                    query: URI.encode_www_form(query)
                  }
                end

      JWT.encode payload, @secret_key, 'HS256'
    end

    def nonce
      DateTime.now.strftime('%Q')
    end
  end
end
