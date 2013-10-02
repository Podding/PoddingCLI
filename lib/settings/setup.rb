# encoding: utf-8

unless File.exists?( settings_file )
  class Setup < Thor
    desc "initial setup","initial setup"
    def initial_setup
      say "It looks like you haven't set anything up yet. (~/.podding is missing.)", :red
      exit unless "y" == ask( "Begin initial setup? (y/n)")
      File.open( settings_file, 'w' ) # touch
      need_to_install = ask( "Do you already have a podding installation (we call them 'projects') on this machine? (y/n)" )
      if need_to_install == "y"
        name = ask("Cool. What would you like to call it from now on? Use a short, easy-to-type name.")
        path = ask("Where is this project?")
        path = File.expand_path( path )
        create_namespace(name, path)
        set_default_namespace(name)
        say "Great. Set #{ name } as default project.", :green
        say "In the future, use podding project new NAME PATH to create new projects, and podding use NAME to set them as default."
        say "Have fun! <3"
        exit
      elsif need_to_install == "n"
        # TODO: Setup
      else
        say "Sorry, what do you mean by #{ need_to_install }? Please try again."
      end
    end
  end

  Setup.new.initial_setup
end