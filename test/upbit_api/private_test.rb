require "test_helper"
require 'pry'

class PrivateTest < Minitest::Test
  def setup
    UpbitApi.configure do |config|
      config.access_key = ENV['UPBIT_ACCESS_KEY']
      config.secret_key = ENV['UPBIT_SECRET_KEY']
    end

    @client = UpbitApi.client
    @client_instance = UpbitApi.client({
      access_key: ENV['UPBIT_ACCESS_KEY'],
      secret_key: ENV['UPBIT_SECRET_KEY'] 
    })
  end

  def test_client
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.accounts
    # pp result
    refute_nil result
  end

  def test_headers
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    query = {market: 'KRW-BTC'}
    header = @client.authorization_headers(query)
    token = header[:Authorization].split(' ').last
    payload = JWT.decode token, nil, false

    assert_equal URI.encode_www_form(query), payload.first['query']
  end

  def test_candles_minutes
    result = @client.candles_minutes(1, 'KRW-BTC')
    # pp result
    refute_nil result
  end

  def test_candles_minutes_count_5
    result = @client.candles_minutes(1, 'KRW-BTC', 5)
    # pp result
    refute_nil result

    assert_equal 5, result.size
  end

  def test_candles_minutes_with_to_date
    # to_date = DateTime.now.strftime('%Y-%m-%dT%H:%M:%S')
    result = @client.candles_minutes(1, 'KRW-BTC', 3, nil)
    # pp result
    refute_nil result

    # assert_equal 5, result.size
  end

  # FIXME: unit has invalid input value
  def test_candles_minutes_with_unit_2_returns_nil
    result = @client.candles_minutes(2, 'KRW-BTC')
    # pp result
    refute_nil result
    refute result[:errors].nil?
  end

  def test_candles_days
    result = @client.candles_days('KRW-BTC')
    # pp result
    refute_nil result
  end

  def test_candles_days_count_10
    result = @client.candles_days('KRW-BTC', 10)
    # pp result
    refute_nil result

    assert_equal 10, result.size
  end

  def test_candles_days_with_converting_price_unit
    result = @client.candles_days('KRW-BTC', 10, nil, 'KRW')
    # pp result
    refute_nil result
  end

  def test_candles_weeks
    result = @client.candles_weeks('KRW-BTC')
    # pp result
    refute_nil result
  end

  def test_candles_months
    result = @client.candles_months('KRW-BTC')
    # pp result
    refute_nil result
  end

  def test_trades_ticks
    # time = DateTime.now.strftime('%Y-%m-%dT%H:%M:%S')
    result = @client.trades_ticks('KRW-BTC', 1, 1)
    # pp result
    refute_nil result
  end

  def test_ticker
    result = @client.ticker('KRW-BTC,KRW-ETH')
    # pp result
    refute_nil result
  end

  def test_orderbook
    result = @client.orderbook('KRW-BTC,KRW-ETH')
    # pp result
    refute_nil result
  end

  def test_orders_chance
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.orders_chance('KRW-BTC')
    # pp result
    refute_nil result
  end

  def test_orders
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.orders('KRW-BTC', 'done')
    # pp result
    refute_nil result
  end
  
  def test_order_by_uuid
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    uuid = '6115ea69-bb3e-4cb6-9e90-be3698681ae5'
    result = @client.order(uuid)
    # pp result
    refute_nil result
  end

  def test_withdraws
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.withdraws('XRP', 'done')
    # pp result
    refute_nil result
  end

  def test_withdraw
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.withdraw('c98eba9c-9713-4f2d-923a-7594b632e48d')
    # pp result
    refute_nil result
  end

  def test_withdraws_chance
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.withdraws_chance('EOS')
    # pp result
    refute_nil result
  end

  def test_deposits
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.deposits('XRP')
    # pp result
    refute_nil result
  end

  def test_deposit
    return if ENV['UPBIT_ACCESS_KEY'].nil?

    result = @client.deposit('f76bfb3e-8c0e-4203-8599-62c964a617eb')
    # pp result
    refute_nil result
  end

  # def test_place_order
  #   return if ENV['UPBIT_ACCESS_KEY'].nil?
  #
  #   result = @client.place_order('KRW-BTC', 'bid', volume, price)
  #   result = @client.place_order('KRW-BTC', 'ask', volume, price)
  # end

  # def test_cancel_order
  #   return if ENV['UPBIT_ACCESS_KEY'].nil?
  #
  #   result = @client.cancel_order(uuid)
  # end

  # def test_withdraws_coin
  #   return if ENV['UPBIT_ACCESS_KEY'].nil?
  #
  #   result = @client.withdraws_coin('BTC', amount, address, secondary_address)
  # end

  # def test_withdraws_krw
  #   return if ENV['UPBIT_ACCESS_KEY'].nil?
  #
  #   result = @client.withdraws_krw(amount)
  # end
end
