# encoding: utf-8

# Commands that deal with the settings file

class PoddingCLI < Thor
  desc "use NAME", "use project NAME to execute commands in (a project is one podding installation, specified in ~/.podding)"
  def use(name)
    if namespace_exists?( name )
      set_default_namespace(name)
      say "Now using podding '#{ name }' in #{ Settings.podding_root }.", :green
    else
      say "Podding #{ name } doesn't exist (yet).", :red

      if "y" == ask( "Would you like to add it to your settings? (y/n)" )
        invoke :add, [ name ]
        set_default_namespace( name )
        say "Set #{ name } as new default podding."
      end # else terminate without doing anything
    end
  end

  desc "add NAME", "add a new podding entry with NAME to ~/.podding file"
  def add(name)
    path = ask "Where is your podding installation located? (Please supply absolute path)"
    create_namespace( name, path )
    say "Added podding #{ name } to ~/.podding!", :green
  end
end
