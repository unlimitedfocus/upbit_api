require "test_helper"
require 'pry'

class AuthorizationTest < Minitest::Test
  def setup
    @authorization = UpbitApi::Authorization.new('test access_key', 'test secret_key')
  end

  def test_authorization
    assert_equal 'test access_key', @authorization.access_key
    assert_equal 'test secret_key', @authorization.secret_key
  end

  def test_nonce
    pp @authorization.nonce
    refute_nil @authorization.nonce
  end

  def test_sign
    token = @authorization.sign
    payload = JWT.decode token, nil, false

    assert_equal @authorization.access_key, payload.first['access_key']
  end

  def test_sign_with_query
    token = @authorization.sign({hello: 'world'})
    payload = JWT.decode token, nil, false
    result = payload.first

    assert_equal @authorization.access_key, result['access_key']
    assert_equal 'world', result['query']['hello']
  end
end
