require "upbit_api/version"
require 'httparty'
require "upbit_api/public"
require "upbit_api/authorization"
require "upbit_api/private"

module UpbitApi
  module_function

  def client(options = {})
    access_key, secret_key = options.fetch(:access_key, nil), options.fetch(:secret_key, nil)
    if access_key.nil? || secret_key.nil?
      UpbitApi::Public
    else
      authorization = UpbitApi::Authorization.new(access_key, secret_key)
      UpbitApi::Private.new(authorization)
    end
  end

  # return errors hash if response not success
  def response(result)
    if result.success?
      result.parsed_response
    else
      { errors: (result.parsed_response || result.code) }
    end
  end
end
