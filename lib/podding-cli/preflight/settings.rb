# encoding: utf-8

unless File.exists?( settings_file )
  class Setup < Thor
    desc "initial setup","initial setup"
    def initial_setup
      say "It looks like you haven't set anything up yet. (~/.podding is missing.)", :red
      exit unless "y" == ask( "Create a settings file? (y/n)")
      say "Podding installations are called projects and get listed in ~/.podding."
      say "To create a settings file, we'll need to create a project."
      name = ask( "What would you like to call the project? Use a short, easy-to-type name." )
      path = ask("Where is this project? (I need a path.)")
      path = File.expand_path( path )
      create_project(name, path)
      puts settings_to_hash
      set_default_project(name)
      say "Great. Set #{ name } as default project.", :green
      say "You can easily add new projects using podding add NAME, and switch between them with podding use NAME."
      say "You can also edit ~/.podding, it's rather straightforward."
      say "If you haven't actually installed podding, you should do that now in #{ path }."
    end
  end

  Setup.new.initial_setup
  exit
end