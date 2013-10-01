# encoding: utf-8

require 'settingslogic'

class Settings < Settingslogic
  source File.join(Dir.home, ".podding")
  self.default ? namespace( self.default ) : namespace( "default" ) # set namespace to the one in ~/.podding
  reload! # reload with newly set namespace
end