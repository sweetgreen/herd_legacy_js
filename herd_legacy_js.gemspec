$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "herd_legacy_js/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "herd_legacy_js"
  s.version     = HerdLegacyJs::VERSION
  s.authors     = ["Hugh Francis"]
  s.email       = ["me@hughfrancis.me"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HerdLegacyJs."
  s.description = "TODO: Description of HerdLegacyJs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 4"

  s.add_development_dependency "sqlite3"
end
