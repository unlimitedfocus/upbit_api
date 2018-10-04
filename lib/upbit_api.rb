require "upbit_api/version"
require 'httparty'
require "upbit_api/public"

module UpbitApi
  def self.client(options={})
    UpbitApi::Public
  end
end
