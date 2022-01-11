require "resolv"

module Attacked
  class BlockedIpAddress < ApplicationRecord

    after_create :create_in_cache

    after_destroy :remove_from_cache

    validates :ip_address, format: {
      with: Regexp.union(Resolv::IPv4::Regex, Resolv::IPv6::Regex)
    }
    validates :ip_address, uniqueness: {
      message: "has already been blocked"
    }

    def self.blocked?(ip_address)
      Attacked.cache.read(blocked_cache_key(ip_address)) ? true : false
    end

    def self.block(ip_address)
      create ip_address: ip_address
    end

    def self.unblock(ip_address)
      blocked_ip_address = find_by(ip_address: ip_address)
      blocked_ip_address.unblock
    end

    def unblock
      destroy
    end

    private

    def create_in_cache
      Attacked.cache.write(blocked_cache_key(ip_address), true)
    end

    def remove_from_cache
      Attacked.cache.delete(blocked_cache_key(ip_address))
    end

    def self.blocked_cache_key(ip_address)
      "attacked_blocked_ip #{ip_address}"
    end

    def blocked_cache_key(ip_address)
      "attacked_blocked_ip #{ip_address}"
    end
  end
end
