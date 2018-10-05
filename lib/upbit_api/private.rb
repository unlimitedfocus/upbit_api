module UpbitApi
  # Public API
  class Private
    include HTTParty
    base_uri 'https://api.upbit.com'

    attr_accessor :authorization

    def initialize(authorization)
      @authorization = authorization
    end

    # https://docs.upbit.com/v1.0/reference#%EC%9E%90%EC%82%B0-%EC%A1%B0%ED%9A%8C
    def accounts
      UpbitApi.response self.class.get('/v1/accounts', headers: authorization_headers)
    end

    # https://docs.upbit.com/v1.0/reference#%EC%A3%BC%EB%AC%B8-%EA%B0%80%EB%8A%A5-%EC%A0%95%EB%B3%B4
    def orders_chance(market)
      query = {
        market: market
      }

      UpbitApi.response self.class.get('/v1/orders/chance', query: query, headers: authorization_headers(query))
    end

    # https://docs.upbit.com/v1.0/reference#%EC%A3%BC%EB%AC%B8-%EB%A6%AC%EC%8A%A4%ED%8A%B8-%EC%A1%B0%ED%9A%8C
    # state = [wait, done, cancel]
    # order_by = [asc, desc]
    def orders(market, state = 'wait', page = 1, order_by = 'asc')
      query = {
        market: market,
        state: state
      }

      UpbitApi.response self.class.get('/v1/orders', query: query, headers: authorization_headers(query))
    end

    # https://docs.upbit.com/v1.0/reference#%EA%B0%9C%EB%B3%84-%EC%A3%BC%EB%AC%B8-%EC%A1%B0%ED%9A%8C
    def order(uuid)
      query = {
        uuid: uuid
      }

      UpbitApi.response self.class.get('/v1/order', query: query, headers: authorization_headers(query))
    end

    # TODO: Not tested
    # https://docs.upbit.com/v1.0/reference#%EC%A3%BC%EB%AC%B8%ED%95%98%EA%B8%B0-1
    # def place_order(market, side, volume, price, ord_type, identifier = nil)
    #   query = {
    #     market: market,
    #     side: side,
    #     volume: volume,
    #     price: price,
    #     ord_type: ord_type,
    #     identifier: identifier
    #   }.compact

    #   UpbitApi.response self.class.post('/v1/orders', query: query, headers: authorization_headers(query))
    # end

    # TODO: Not tested
    # https://docs.upbit.com/v1.0/reference#%EC%A3%BC%EB%AC%B8-%EC%B7%A8%EC%86%8C
    # def cancel_order(uuid)
    #   query = {
    #     uuid: uuid
    #   }

    #   UpbitApi.response self.class.delete('/v1/order', query: query, headers: authorization_headers(query))
    # end

    # https://docs.upbit.com/v1.0/reference#%EC%A0%84%EC%B2%B4-%EC%B6%9C%EA%B8%88-%EC%A1%B0%ED%9A%8C
    # state = [submitting, submitted, almost_accepted, rejected, accepted, processing, done, canceled]
    def withdraws(currency, state, limit = 100)
      query = {
        currency: currency,
        state: state,
        limit: limit
      }

      UpbitApi.response self.class.get('/v1/withdraws', query: query, headers: authorization_headers(query))
    end

    # https://docs.upbit.com/v1.0/reference#%EA%B0%9C%EB%B3%84-%EC%B6%9C%EA%B8%88-%EC%A1%B0%ED%9A%8C
    def withdraw(uuid)
      query = {
        uuid: uuid
      }

      UpbitApi.response self.class.get('/v1/withdraw', query: query, headers: authorization_headers(query))
    end

    # https://docs.upbit.com/v1.0/reference#%EC%B6%9C%EA%B8%88-%EA%B0%80%EB%8A%A5-%EC%A0%95%EB%B3%B4
    def withdraws_chance(currency)
      query = {
        currency: currency
      }

      UpbitApi.response self.class.get('/v1/withdraws/chance', query: query, headers: authorization_headers(query))
    end

    # TODO: Not tested
    # https://docs.upbit.com/v1.0/reference#%EC%B6%9C%EA%B8%88-%EA%B0%80%EB%8A%A5-%EC%A0%95%EB%B3%B4
    # def withdraws_coin(currency, amount, address, secondary_address)
    #   query = {
    #     currency: currency,
    #     amount: amount,
    #     address: address,
    #     secondary_address: secondary_address
    #   }.compact

    #   UpbitApi.response self.class.post('/v1/withdraws/coin', query: query, headers: authorization_headers(query))
    # end

    # TODO: Not tested
    # https://docs.upbit.com/v1.0/reference#%EC%9B%90%ED%99%94-%EC%B6%9C%EA%B8%88%ED%95%98%EA%B8%B0
    # def withdraws_krw(amount)
    #   query = {
    #     amount: amount
    #   }

    #   UpbitApi.response self.class.post('/v1/withdraws/krw', query: query, headers: authorization_headers(query))
    # end

    # https://docs.upbit.com/v1.0/reference#%EC%9E%85%EA%B8%88
    def deposits(currency, limit = nil, page = 1, order_by = 'asc')
      query = {
        currency: currency,
        limit: limit,
        page: page,
        order_by: order_by
      }.compact

      UpbitApi.response self.class.get('/v1/deposits', query: query, headers: authorization_headers(query))
    end

    # https://docs.upbit.com/v1.0/reference#%EA%B0%9C%EB%B3%84-%EC%9E%85%EA%B8%88-%EC%A1%B0%ED%9A%8C
    def deposit(uuid)
      query = {
        uuid: uuid
      }

      UpbitApi.response self.class.get('/v1/deposit', query: query, headers: authorization_headers(query))
    end

    private

    def authorization_headers(query = nil)
      {Authorization: "Bearer #{@authorization.sign(query)}"}
    end
  end
end
