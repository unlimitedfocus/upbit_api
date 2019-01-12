require "test_helper"

class UpbitApiTest < Minitest::Test
  def test_that_it_has_a_version_0_0_0
    assert_equal "0.0.1", ::UpbitApi::VERSION
  end

  def test_client
    refute_nil UpbitApi.client
  end

  def test_default_configuration
    UpbitApi.configuration.reset
    assert_nil UpbitApi.configuration.access_key
    assert_nil UpbitApi.configuration.secret_key
    assert_equal UpbitApi::Configuration::DEFAULT_USER_AGENT, UpbitApi.configuration.user_agent
    refute UpbitApi.configuration.debug
  end

  def test_configuration
    UpbitApi.configuration.reset
    UpbitApi.configure do |config|
      config.access_key = ENV['UPBIT_ACCESS_KEY']
        config.secret_key = ENV['UPBIT_SECRET_KEY']
    end

    assert_equal ENV['UPBIT_ACCESS_KEY'], UpbitApi.configuration.access_key
    assert_equal ENV['UPBIT_SECRET_KEY'], UpbitApi.configuration.secret_key
    assert_equal UpbitApi::Configuration::DEFAULT_USER_AGENT, UpbitApi.configuration.user_agent
    refute UpbitApi.configuration.debug
  end
end
