$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "upbit_api"

require "minitest/autorun"

require 'dotenv'
Dotenv.load '.env.test'
