# -*- encoding: utf-8 -*-
# stub: squasher 0.6.1 ruby lib

Gem::Specification.new do |s|
  s.name = "squasher".freeze
  s.version = "0.6.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Sergey Pchelintsev".freeze]
  s.date = "2018-07-27"
  s.description = "Squash your old migrations".freeze
  s.email = ["linz.sergey@gmail.com".freeze]
  s.executables = ["squasher".freeze]
  s.files = ["bin/squasher".freeze]
  s.homepage = "https://github.com/jalkoby/squasher".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.5.2.1".freeze
  s.summary = "Squash your old migrations".freeze

  s.installed_by_version = "2.5.2.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, [">= 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 3.3.0"])
    else
      s.add_dependency(%q<bundler>.freeze, [">= 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 3.3.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, [">= 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 3.3.0"])
  end
end
