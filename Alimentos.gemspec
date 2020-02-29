
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "Alimentos/version"

Gem::Specification.new do |spec|
  spec.name          = "Alimentos"
  spec.version       = Alimentos::VERSION
  spec.authors       = ["Adrián Herrera Darias "]
  spec.email         = ["alu0100799101@ull.edu.es"]

  spec.summary       = %q{Practica 2 Desarrollo Dirigido por Pruebas TDD}
  spec.description   = %q{Desarrollo Pruebas TDD donde tendremos en cuenta el consumo de kcal total de los diferentes alimentos}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100799101.git"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-alu0100799101.git'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency "bundler", "~> 2.0.2"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.8.0"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "coveralls"
end
