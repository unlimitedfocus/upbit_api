require "test_helper"

class UpbitApiTest < Minitest::Test
  def test_that_it_has_a_version_0_0_0
    assert_equal "0.0.0", ::UpbitApi::VERSION
  end

  def test_client
    refute_nil UpbitApi.client
  end
end
