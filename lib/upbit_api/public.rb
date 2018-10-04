module UpbitApi
  class Public
    include HTTParty
    base_uri 'https://api.upbit.com'

    # TODO: replace parsed_response with response/error handler

    # https://docs.upbit.com/v1.0/reference#%EC%8B%9C%EC%84%B8-%EC%A2%85%EB%AA%A9-%EC%A1%B0%ED%9A%8C
    def self.market
      get('/v1/market/all', verify: true).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EB%B6%84minute-%EC%BA%94%EB%93%A4-1
    # units = [1, 3, 5, 15, 10, 30, 60, 240]
    def self.candels_minutes(unit, market, count = 1, to = nil)
      get("/v1/candles/minutes/#{unit}", query: {
        market: market,
        to: to,
        count: count
      }).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EC%9D%BCday-%EC%BA%94%EB%93%A4-1
    # converting_price_unit: KRW
    def self.candels_days(market, count = 1, to = nil, converting_price_unit = nil)
      get("/v1/candles/days", query: {
        market: market,
        to: to,
        count: count,
        convertingPriceUnit: converting_price_unit
      }).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EC%A3%BCweek-%EC%BA%94%EB%93%A4-1
    def self.candels_weeks(market, count = 1, to = nil)
      get("/v1/candles/weeks", query: {
        market: market,
        to: to,
        count: count
      }).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EC%9B%94month-%EC%BA%94%EB%93%A4-1
    def self.candels_months(market, count = 1, to = nil)
      get("/v1/candles/months", query: {
        market: market,
        to: to,
        count: count
      }).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EC%8B%9C%EC%84%B8-%EC%B2%B4%EA%B2%B0-%EC%A1%B0%ED%9A%8C
    def self.trades_ticks(market, count = 1, cursor = 1, to = nil)
      get("/v1/trades/ticks", query: {
        market: market,
        to: to,
        count: count,
        cursor: cursor
      }).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EC%8B%9C%EC%84%B8-ticker-%EC%A1%B0%ED%9A%8C
    def self.ticker(markets)
      get("/v1/ticker", query: {
        markets: markets
      }).parsed_response
    end

    # https://docs.upbit.com/v1.0/reference#%EC%8B%9C%EC%84%B8-%ED%98%B8%EA%B0%80-%EC%A0%95%EB%B3%B4orderbook-%EC%A1%B0%ED%9A%8C
    def self.orderbook(markets)
      get("/v1/orderbook", query: {
        markets: markets
      }).parsed_response
    end
  end
end