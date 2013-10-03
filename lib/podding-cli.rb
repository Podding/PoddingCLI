# encoding: utf-8

require 'thor'
require 'settingslogic'

require_relative 'settings/settings_helpers'

require_relative 'commands/project'
require_relative 'settings/setup'
require_relative 'settings/load_settings'

# Load subcommands
require_relative 'commands/episode'
require_relative 'commands/settings'