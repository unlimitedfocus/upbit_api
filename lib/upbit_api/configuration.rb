module UpbitApi
  class Configuration
    attr_accessor :access_key, :secret_key, :user_agent, :debug

    VALID_OPTIONS_KEYS = [
      :access_key,
      :secret_key,
      :user_agent,
      :debug
    ].freeze

    # The user agent that will be sent to the API endpoint if none is set
    DEFAULT_USER_AGENT = "UpbitApi Ruby Gem #{UpbitApi::VERSION}".freeze

    def initialize(access_key = nil, secret_key = nil, user_agent = DEFAULT_USER_AGENT, debug = false)
      @access_key = access_key
      @secret_key = secret_key
      @user_agent = user_agent
      @debug = debug
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def reset
      @access_key = nil
      @secret_key = nil
      @user_agent = DEFAULT_USER_AGENT
    end
  end
end
