lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'clowder/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'httpclient', '~> 2.6.0.1'
  spec.add_development_dependency 'bundler', '~> 1.10.4'
  spec.authors = ['Eric Scrivner']
  spec.description = 'A Ruby interface to the Clowder API'
  spec.email = %w(eric.t.scrivner@gmail.com)
  spec.files = %w(README.md LICENSE.md clowder.gemspec) + Dir['lib/**/*.rb']
  spec.homepage = 'http://www.clowder.io'
  spec.licenses = %w(MIT)
  spec.name = 'clowder'
  spec.require_paths = %w(lib)
  spec.required_ruby_version = '>= 1.9.3'
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary = spec.description
  spec.version = Clowder::Version
end
