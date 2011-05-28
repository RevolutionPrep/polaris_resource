# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{polaris_resource}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Moran"]
  s.date = %q{2011-05-27}
  s.description = %q{RESTful API Client}
  s.email = %q{ryan.moran@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "autotest/discover.rb",
    "lib/ext/typhoeus.rb",
    "lib/polaris_resource/base.rb",
    "lib/polaris_resource/base/associations.rb",
    "lib/polaris_resource/base/attributes.rb",
    "lib/polaris_resource/base/finders.rb",
    "lib/polaris_resource/configuration.rb",
    "lib/polaris_resource/errors.rb",
    "lib/polaris_resource/mock.rb",
    "polaris-resource.gemspec",
    "spec/polaris_resource/base/associations_spec.rb",
    "spec/polaris_resource/base/attributes_spec.rb",
    "spec/polaris_resource/base/finders_spec.rb",
    "spec/polaris_resource/base_spec.rb",
    "spec/polaris_resource/configuration_spec.rb",
    "spec/polaris_resource/mock_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/configuration.rb"
  ]
  s.homepage = %q{http://github.com/ryanmoran/polaris_resource}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{RESTful API Client}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<yajl-ruby>, ["~> 0.8.2"])
      s.add_runtime_dependency(%q<typhoeus>, ["~> 0.2.4"])
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.7"])
      s.add_runtime_dependency(%q<i18n>, ["~> 0.5.0"])
      s.add_development_dependency(%q<rspec>, ["= 2.6.0"])
      s.add_development_dependency(%q<yard>, ["= 0.6.8"])
      s.add_development_dependency(%q<bundler>, ["= 1.0.13"])
      s.add_development_dependency(%q<jeweler>, ["= 1.6.0"])
      s.add_development_dependency(%q<rcov>, ["= 0.9.9"])
      s.add_development_dependency(%q<autotest>, ["= 4.4.6"])
    else
      s.add_dependency(%q<yajl-ruby>, ["~> 0.8.2"])
      s.add_dependency(%q<typhoeus>, ["~> 0.2.4"])
      s.add_dependency(%q<activesupport>, ["~> 3.0.7"])
      s.add_dependency(%q<i18n>, ["~> 0.5.0"])
      s.add_dependency(%q<rspec>, ["= 2.6.0"])
      s.add_dependency(%q<yard>, ["= 0.6.8"])
      s.add_dependency(%q<bundler>, ["= 1.0.13"])
      s.add_dependency(%q<jeweler>, ["= 1.6.0"])
      s.add_dependency(%q<rcov>, ["= 0.9.9"])
      s.add_dependency(%q<autotest>, ["= 4.4.6"])
    end
  else
    s.add_dependency(%q<yajl-ruby>, ["~> 0.8.2"])
    s.add_dependency(%q<typhoeus>, ["~> 0.2.4"])
    s.add_dependency(%q<activesupport>, ["~> 3.0.7"])
    s.add_dependency(%q<i18n>, ["~> 0.5.0"])
    s.add_dependency(%q<rspec>, ["= 2.6.0"])
    s.add_dependency(%q<yard>, ["= 0.6.8"])
    s.add_dependency(%q<bundler>, ["= 1.0.13"])
    s.add_dependency(%q<jeweler>, ["= 1.6.0"])
    s.add_dependency(%q<rcov>, ["= 0.9.9"])
    s.add_dependency(%q<autotest>, ["= 4.4.6"])
  end
end
