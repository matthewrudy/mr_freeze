# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mr_freeze}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matthew Rudy Jacobs"]
  s.date = %q{2011-04-19}
  s.email = %q{MatthewRudyJacobs@gmail.com}
  s.files = ["test/mr_freeze_test.rb", "test/test_helper.rb", "lib/mr_freeze/core_extensions.rb", "lib/mr_freeze/version.rb", "lib/mr_freeze.rb"]
  s.homepage = %q{https://github.com/matthewrudy/mr_freeze}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.5.0}
  s.summary = %q{freeze objects nestedly}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<active_support>, [">= 0"])
    else
      s.add_dependency(%q<active_support>, [">= 0"])
    end
  else
    s.add_dependency(%q<active_support>, [">= 0"])
  end
end
