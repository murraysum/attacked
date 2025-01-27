require_relative "lib/attacked/version"

Gem::Specification.new do |spec|
  spec.name        = "attacked"
  spec.version     = Attacked::VERSION
  spec.authors     = ["Murray Summers"]
  spec.email       = ["murray.sum@gmail.com"]
  spec.homepage    = "https://github.com/murraysum/attacked"
  spec.summary     = "Manage a persisted list of blocked IP addresses"
  spec.description = "Manage a persisted list of blocked IP addresses and block these requests"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/murraysum/attacked"
  spec.metadata["changelog_uri"] = "https://github.com/murraysum/attacked"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.1.0"
end
