require "test_helper"
require 'pry'

class ConfigurationTest < Minitest::Test
  def setup
    @access_key = ENV['UPBIT_ACCESS_KEY'] || 'test access_key'
    @secret_key = ENV['UPBIT_SECRET_KEY'] || 'test secret_key'
    @configuration = UpbitApi::Configuration.new(@access_key, @secret_key)
  end

  def test_keys
    assert_equal 'test access_key', @access_key
    assert_equal 'test secret_key', @secret_key
  end

  def test_configuration
    assert_equal 'test access_key', @configuration.access_key
    assert_equal 'test secret_key', @configuration.secret_key
  end

  def test_options
    assert_equal @access_key, @configuration.options[:access_key]
    assert_equal @secret_key, @configuration.options[:secret_key]
    assert_equal UpbitApi::Configuration::DEFAULT_USER_AGENT, @configuration.options[:user_agent]
    refute @configuration.options[:debug]
  end
end
