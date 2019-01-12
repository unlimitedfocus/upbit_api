
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "upbit_api/version"

Gem::Specification.new do |spec|
  spec.name          = "upbit_api"
  spec.version       = UpbitApi::VERSION
  spec.authors       = ["JungChoon Park"]
  spec.email         = ["unlimitedfocus@gmail.com"]

  spec.summary       = %q{Ruby wrapper for Upbit API}
  spec.description   = %q{Ruby wrapper for Upbit API https://docs.upbit.com/docs}
  spec.homepage      = "https://github.com/unlimitedfocus/upbit_api"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "jwt", "~> 2.1.0"
  spec.add_dependency "httparty", "~> 0.16.2"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "guard", "~> 2.14.2"
  spec.add_development_dependency "guard-minitest", "~> 2.4.6"
  spec.add_development_dependency 'terminal-notifier-guard', '~> 1.6.1'
  spec.add_development_dependency 'dotenv', '~> 2.5.0'
  # spec.add_development_dependency "guard-rubocop", "~> 1.3.0"
  spec.add_development_dependency "pry-byebug", "~> 3.6.0"
end
