require "test_helper"

class AttackedTest < ActiveSupport::TestCase

  test "it has a version number" do
    assert Attacked::VERSION
  end

  test "defaults to the Rails cache" do
    assert_equal Rails.cache, Attacked.cache
  end

  test "a cache can be configured" do
    cache = ActiveSupport::Cache::NullStore.new

    Attacked.setup do |config|
      config.cache = cache
    end

    assert_not_equal Rails.cache, Attacked.cache
    assert_equal cache, Attacked.cache

    # reset the cache back to the rails cache
    Attacked.setup do |config|
      config.cache = Rails.cache
    end
  end
end
