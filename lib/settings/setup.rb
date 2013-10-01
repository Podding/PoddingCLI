# encoding: utf-8

unless File.exists?( settings_file )
  class Setup < Thor

    desc "", "" # needed to prevent Thor from crying
    def initial_setup
      exit unless "y" == ask(  "I looks like you haven't set anything up yet. Would you like to start? (y/n)" )
      say "First, we need to create a file to store your settings. It will live in #{ settings_file }."
      # To do: Actually do stuff.
      exit
    end
  end

  Setup.new.invoke :initial_setup
end