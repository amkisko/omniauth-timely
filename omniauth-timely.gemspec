lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/timely/version'

Gem::Specification.new do |spec|
  spec.name          = 'omniauth-timely'
  spec.version       = OmniAuth::Timely::VERSION
  spec.authors       = ['dany1468']
  spec.email         = ['dany1468@gmail.com']

  spec.summary       = %q{OmniAuth strategy for Timely}
  spec.description   = %q{OmniAuth strategy for Timely}
  spec.homepage      = 'https://github.com/dany1468/omniauth-timely'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth', '~> 2'
  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1'

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'rake', '~> 13'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rspec', '~> 3'
end
