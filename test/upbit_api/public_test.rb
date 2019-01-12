require "test_helper"
require 'pry'

class PublicTest < Minitest::Test
  def setup
    @client = UpbitApi.client
  end

  def test_market
    result = @client.market
    # pp result
    refute_nil result

    first_market = result.first
    refute_nil first_market['market']
    refute_nil first_market['korean_name']
    refute_nil first_market['english_name']
  end

  # def test_candles
  #   result_minutes = @client.candles('minutes', 'KRW-BTC', 3, 5)
  #   refute_nil result_minutes

  #   result_days = @client.candles('days', 'KRW-BTC')
  #   refute_nil result_days

  #   result_weeks = @client.candles('weeks', 'KRW-BTC')
  #   refute_nil result_weeks

  #   result_months = @client.candles('months', 'KRW-BTC')
  #   refute_nil result_months
  # end

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
end
