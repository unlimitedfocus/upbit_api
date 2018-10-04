require "test_helper"
# require 'pry'

class PublicTest < Minitest::Test
  def test_market
    result = UpbitApi::Public.market
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_candels_minutes
    result = UpbitApi::Public.candels_minutes(1, 'KRW-BTC')
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_candels_days
    result = UpbitApi::Public.candels_days('KRW-BTC')
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_candels_weeks
    result = UpbitApi::Public.candels_weeks('KRW-BTC')
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_candels_months
    result = UpbitApi::Public.candels_months('KRW-BTC')
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_trades_ticks
    # time = DateTime.now.strftime('%Y-%m-%dT%H:%M:%S')
    result = UpbitApi::Public.trades_ticks('KRW-BTC', 1, 1)
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_ticker
    result = UpbitApi::Public.ticker('KRW-BTC,KRW-ETH')
    # pp result
    assert result.success?
    refute_nil result
  end

  def test_orderbook
    result = UpbitApi::Public.orderbook('KRW-BTC,KRW-ETH')
    # pp result
    assert result.success?
    refute_nil result
  end
end
