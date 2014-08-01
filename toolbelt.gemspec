# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'toolbelt/version'

Gem::Specification.new do |spec|
  spec.name        = 'toolbelt'
  spec.version     = Toolbelt::VERSION
  spec.authors     = ['PJ Kelly']
  spec.email       = ['pj@crushlovely.com']
  spec.homepage    = 'https://github.com/crushlovely/toolbelt'
  spec.summary     = 'Utility to create signed URLs for uploading files straight to Amazon S3.'
  spec.description = 'Utility to create signed URLs for uploading files straight to Amazon S3.'

  spec.rubyforge_project = 'toolbelt'

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency('hashie')
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency('pry')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('guard')
  spec.add_development_dependency('guard-rspec')
  spec.add_development_dependency('guard-rubocop')
  spec.add_development_dependency('codeclimate-test-reporter')
end
