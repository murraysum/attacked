require "test_helper"

module Attacked
  class BlockedIpAddressTest < ActiveSupport::TestCase

    setup do
      Attacked.cache.clear
    end

    test "validates an ip address is present" do
      blocked_ip_address = BlockedIpAddress.new
      assert blocked_ip_address.invalid?

      assert_equal ["is invalid"], blocked_ip_address.errors[:ip_address]
    end

    test "validates the format of the ip address" do
      blocked_ip_address = BlockedIpAddress.new ip_address: "1.a.2b.3"
      assert blocked_ip_address.invalid?

      assert_equal ["is invalid"], blocked_ip_address.errors[:ip_address]
    end

    test "validates the ip address is unique" do
      BlockedIpAddress.create ip_address: "1.2.3.4"

      blocked_ip_address = BlockedIpAddress.new ip_address: "1.2.3.4"
      assert blocked_ip_address.invalid?

      assert blocked_ip_address.errors[:ip_address].include?("has already been blocked")
    end

    test "blocking an ip address" do
      ip_address = "1.2.3.4"

      refute BlockedIpAddress.blocked?(ip_address)

      BlockedIpAddress.block(ip_address)

      assert BlockedIpAddress.blocked?(ip_address)
    end

    test "unblocking an ip address" do
      ip_address = "1.2.3.4"
      BlockedIpAddress.block(ip_address)

      assert BlockedIpAddress.blocked?(ip_address)

      BlockedIpAddress.unblock(ip_address)

      refute BlockedIpAddress.blocked?(ip_address)
    end
  end
end
