# encoding: utf-8

require 'thor'
require 'settingslogic'

require 'podding-cli/version'

require_relative 'podding-cli/settings/settings_helpers'

require_relative 'podding-cli/episodes/episode_helpers'

require_relative 'podding-cli/auphonic/auphonic'
require_relative 'podding-cli/auphonic/production'

require_relative 'podding-cli/preflight/settings'
require_relative 'podding-cli/preflight/current_project'

require_relative 'podding-cli/settings/load_settings'

require_relative 'podding-cli/preflight/auphonic'

# Load subcommands
require_relative 'podding-cli/commands/episode'
require_relative 'podding-cli/commands/settings'