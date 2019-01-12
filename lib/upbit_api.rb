require "upbit_api/version"
require "upbit_api/configuration"
require 'httparty'
require "upbit_api/public"
require "upbit_api/authorization"
require "upbit_api/private"

module UpbitApi
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.client(options = UpbitApi.configuration.options)
    access_key, secret_key = options.fetch(:access_key, nil), options.fetch(:secret_key, nil)
    if access_key.nil? || secret_key.nil?
      UpbitApi::Public.new
    else
      authorization = UpbitApi::Authorization.new(access_key, secret_key)
      UpbitApi::Private.new(authorization)
    end
  end

  # return errors hash if response not success
  def self.response(result)
    if result.success?
      result.parsed_response
    else
      { errors: (result.parsed_response || result.code) }
    end
  end
end
