# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lastfm/version'

Gem::Specification.new do |gem|
  gem.authors       = ["Derek Szeto"]
  gem.email         = ["derek.szeto@gettyimages.com"]
  gem.description   = %q{Lightweight wrapper for Last.fm API }
  gem.summary       = %q{This is a minimal wrapper for the Last.fm API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "lastfm"
  gem.require_paths = ["lib"]
  gem.version       = Lastfm::VERSION
end
