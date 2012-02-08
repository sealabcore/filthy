# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "filthy"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Mike Taylor"]
  s.date = "2012-02-08"
  s.description = "Check if an attribute was changed after the last save."
  s.email = "michael.taylor@bookrenter.com"
  s.extra_rdoc_files = ["README.md", "README.rdoc", "lib/filthy.rb"]
  s.files = ["README.md", "README.rdoc", "Rakefile", "lib/filthy.rb", "test/database.yml", "test/filthy_test.rb", "test/helper.rb", "Manifest", "filthy.gemspec"]
  s.homepage = "http://github.com/sealabcore/filthy"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Filthy", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "filthy"
  s.rubygems_version = "1.8.10"
  s.summary = "Check if an attribute was changed after the last save."
  s.test_files = ["test/filthy_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<active_record>, [">= 0"])
      s.add_development_dependency(%q<active_support>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<shoulda-context>, [">= 0"])
      s.add_development_dependency('echoe')
    else
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<active_record>, [">= 0"])
      s.add_dependency(%q<active_support>, [">= 0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<shoulda-context>, [">= 0"])
    end
  else
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<active_record>, [">= 0"])
    s.add_dependency(%q<active_support>, [">= 0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<shoulda-context>, [">= 0"])
  end
end
