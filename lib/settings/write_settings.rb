# encoding: utf-8

require 'yaml'

Encoding.default_external = 'UTF-8'

def settings_file
  File.join(Dir.home, ".podding")
end

def settings_to_hash
  YAML.load(File.read(settings_file))
end

def hash_to_settings( settings )
  File.open(settings_file, 'w') { |file| file.write settings.to_yaml }
end

def set_default_namespace(name)
  settings = settings_to_hash
  settings["default"] = name
  hash_to_settings( settings )
end

def namespace_exists?(name)
  settings_to_hash.keys.include?( name )
end