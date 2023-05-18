# frozen_string_literal: true

require_relative 'lib/sheet_happens/version'
Gem::Specification.new do |s|
  s.name        = 'sheet_happens'
  s.version     = SheetHappens::VERSION
  s.authors     = ['Umar']
  s.email       = ['umar.rana@outlook.com']
  s.homepage    = ''
  s.summary     = 'Ruby gem that turns SQL into reports.'
  s.description = 'Dossier is a ruby gem that turns SQL into reports. Reports can be easily rendered in various formats, like HTML, CSV, XLS, and JSON.'
  s.license     = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'rake', '~> 13.0'
  s.add_development_dependency 'rubocop', '~> 0.60'
  s.add_development_dependency 'rubocop-performance', '~> 1.5'
  s.add_development_dependency 'rubocop-rspec', '~> 1.37'
  s.metadata['rubygems_mfa_required'] = 'true'
end
