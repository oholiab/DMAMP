# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "dmamp"
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Matt Carroll"]
  s.date = "2012-05-17"
  s.description = "Templating for puppet module patterns"
  s.email = "oholiab@gmail.com"
  s.executables = ["dmamp"]
  s.extra_rdoc_files = ["CHANGELOG", "README.md", "bin/dmamp", "lib/dmamp.rb", "lib/dmamp/defaultargs.rb", "lib/dmamp/mod.rb", "lib/dmamp/optionparser.rb", "lib/dmamp/pattern.rb", "lib/dmamp/patterns/parameterised-PCS/templates/config.pp", "lib/dmamp/patterns/parameterised-PCS/templates/init.pp", "lib/dmamp/patterns/parameterised-PCS/templates/package.pp", "lib/dmamp/patterns/parameterised-PCS/templates/params.pp", "lib/dmamp/patterns/parameterised-PCS/templates/service.pp", "lib/dmamp/version.rb"]
  s.files = ["CHANGELOG", "Manifest", "README.md", "Rakefile", "bin/dmamp", "lib/dmamp.rb", "lib/dmamp/defaultargs.rb", "lib/dmamp/mod.rb", "lib/dmamp/optionparser.rb", "lib/dmamp/pattern.rb", "lib/dmamp/patterns/parameterised-PCS/templates/config.pp", "lib/dmamp/patterns/parameterised-PCS/templates/init.pp", "lib/dmamp/patterns/parameterised-PCS/templates/package.pp", "lib/dmamp/patterns/parameterised-PCS/templates/params.pp", "lib/dmamp/patterns/parameterised-PCS/templates/service.pp", "lib/dmamp/version.rb", "spec/mod_spec.rb", "spec/opt_spec.rb", "spec/testcommon.rb", "dmamp.gemspec"]
  s.homepage = "http://github.com/oholiab/DMAMP"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Dmamp", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "dmamp"
  s.rubygems_version = "1.8.24"
  s.summary = "Templating for puppet module patterns"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
