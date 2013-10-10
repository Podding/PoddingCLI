# encoding: utf-8

require 'yaml'

Encoding.default_external = 'UTF-8'

def settings_file
  File.join(Dir.home, ".podding")
end

def settings_to_hash
  if File.exists?( settings_file )
    return YAML.load(File.read(settings_file))
  else
    return {}
  end
end

def hash_to_settings( settings )
  File.open(settings_file, 'w') { |file| file.write( settings.to_yaml )}
end

def add_key_to_settings( key, value )
  settings = settings_to_hash
  settings[ key ] = value
  hash_to_settings(settings)
end

def set_default_namespace(name)
  settings = {}
  settings["default"] = name
  settings = settings.merge(settings_to_hash) # makes sure that default ends up on top of the yaml
  hash_to_settings( settings )
  Settings.reload! if defined?( Settings )
end

def namespace_exists?(name)
  settings_to_hash.keys.include?( name )
end

def create_namespace(name, path)
  add_key_to_settings( name, { "podding_root" => path } )
end