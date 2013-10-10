# encoding: utf-8

require 'thor'
require 'settingslogic'

require_relative 'lib/settings/settings_helpers'

require_relative 'lib/preflight/settings'
require_relative 'lib/preflight/current_project'
require_relative 'lib/settings/load_settings'

# Load subcommands
require_relative 'commands/episode'
require_relative 'commands/settings'