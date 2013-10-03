# encoding: utf-8

# Subcommands that deal with managing projects

class ProjectCLi < Thor
  namespace :project

  desc "new NAME PATH", "installs a new podding project in PATH with a given (ideally short and memorable) NAME"
  def new(name = nil, path = nil)
    unless path
      path = ask( "Where would you like to install your new podding project?" )
    end
    path = File.expand_path( path )
    unless name
      name = ask( "What would you like your podding project to be called? (It is trivial to change this later in ~/.podding.)" )
    end

    say "Installing a new podding in #{ path }... ", :green
  end
end