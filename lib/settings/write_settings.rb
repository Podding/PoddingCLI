# encoding: utf-8

require 'yaml'

Encoding.default_external = 'UTF-8'

def settings_file
  File.join(Dir.home, ".podding")
end

def set_default_namespace(name)
  settings = YAML.load(File.read(settings_file))
  settings["default"] = name
  File.open(settings_file, 'w') { |file| file.write settings.to_yaml }
end