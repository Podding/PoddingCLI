# encoding: utf-8

require 'thor'
require 'settingslogic'

require_relative 'settings/load_settings'
require_relative 'settings/settings_helpers'

# Load subcommands
require_relative 'commands/episode'
require_relative 'commands/settings'