require "test_helper"
require 'pry'

class PrivateTest < Minitest::Test
  def setup
    @client = UpbitApi.client({
      access_key: 'test access_key',
      secret_key: 'test secret_key'
    })
  end

  def test_client
    result = @client.accounts
    # pp result
    refute_nil result
  end

  # def test_headers
  #   query = {market: 'KRW-BTC'}
  #   header = @client.authorization_headers(query)
  #   token = header[:Authorization].split(' ').last
  #   payload = JWT.decode token, nil, false

  #   assert_equal URI.encode_www_form(query), payload.first['query']
  # end

  def test_orders_chance
    result = @client.orders_chance('KRW-BTC')
    # pp result
    refute_nil result
  end

  def test_orders
    result = @client.orders('KRW-BTC', 'done')
    # pp result
    refute_nil result
  end
  
  def test_order_by_uuid
    uuid = '6115ea69-bb3e-4cb6-9e90-be3698681ae5'
    result = @client.order(uuid)
    # pp result
    refute_nil result
  end

  def test_withdraws
    result = @client.withdraws('XRP', 'done')
    # pp result
    refute_nil result
  end

  def test_withdraw
    result = @client.withdraw('c98eba9c-9713-4f2d-923a-7594b632e48d')
    # pp result
    refute_nil result
  end

  def test_withdraws_chance
    result = @client.withdraws_chance('EOS')
    # pp result
    refute_nil result
  end

  def test_deposits
    result = @client.deposits('XRP')
    # pp result
    refute_nil result
  end

  def test_deposit
    result = @client.deposit('f76bfb3e-8c0e-4203-8599-62c964a617eb')
    # pp result
    refute_nil result
  end
end
