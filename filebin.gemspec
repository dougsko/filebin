# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{filebin}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["dougsko"]
  s.date = %q{2009-12-08}
  s.default_executable = %q{filebin}
  s.description = %q{Command line interface to filebin.ca}
  s.email = %q{dougtko@gmail.com}
  s.executables = ["filebin"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/filebin",
     "lib/filebin.rb",
     "spec/filebin_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/dougsko/filebin}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["/bin", "/lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Command line interface to filebin.ca}
  s.test_files = [
    "spec/filebin_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httpclient>, [">= 0"])
      s.add_runtime_dependency(%q<hpricot>, [">= 0"])
      s.add_runtime_dependency(%q<httpclient>, [">= 0"])
    else
      s.add_dependency(%q<httpclient>, [">= 0"])
      s.add_dependency(%q<hpricot>, [">= 0"])
      s.add_dependency(%q<httpclient>, [">= 0"])
    end
  else
    s.add_dependency(%q<httpclient>, [">= 0"])
    s.add_dependency(%q<hpricot>, [">= 0"])
    s.add_dependency(%q<httpclient>, [">= 0"])
  end
end
