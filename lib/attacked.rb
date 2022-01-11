require "attacked/version"
require "attacked/engine"

module Attacked
  # Your code goes here...

  mattr_writer :cache

  def self.setup
    yield self
  end

  def self.cache
    @@cache || Rails.cache
  end
end
