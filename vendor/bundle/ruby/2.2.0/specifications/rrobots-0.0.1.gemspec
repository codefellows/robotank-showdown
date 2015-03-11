# -*- encoding: utf-8 -*-
# stub: rrobots 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rrobots"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Marcin Michalowski"]
  s.date = "2011-11-24"
  s.description = "RRobots is a simulation environment for robots, these robots have a scanner and a gun, can move forward and backwards and are entirely controlled by ruby scripts."
  s.email = ["h13ronim@gmail.com"]
  s.executables = ["rrobots", "tournament"]
  s.files = ["bin/rrobots", "bin/tournament"]
  s.homepage = ""
  s.rubyforge_project = "rrobots"
  s.rubygems_version = "2.4.5"
  s.summary = "RRobots is a C-Robots/Robocode clone written entirely in ruby."

  s.installed_by_version = "2.4.5" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<gosu>, [">= 0"])
    else
      s.add_dependency(%q<gosu>, [">= 0"])
    end
  else
    s.add_dependency(%q<gosu>, [">= 0"])
  end
end
