# encoding: utf-8

class EpisodeCLI < Thor

  desc "episode new NAME (OPTIONS)", "create new episode with NAME"
  option :show, :aliases => :s
  option :date, :aliases => :d
  option :title, :aliases => :t

  def new(name)
    unless options[:show]
      show = name.split("-").first
      say "Assuming you mean show '#{ show }'. (Pass explicitly with --show)"
    else
      show = options[:show]
    end
    
    unless options[:date]
      date = Date.today.to_s
      say "Assuming date '#{ date }'. (Pass explicitly with --date)"  
    else
      date = options[:date]
    end
    
    unless options[:date]
      title = name.gsub("-","").upcase  
    else
      title = options[:title]
    end

    # Find path to put the episodes in, and make sure nothing goes wrong
    episode_folder = File.join(Settings.podding_root, "source", "episodes", show)
    raise Thor::Error, "Can't create episode in folder #{ episode_folder } because the folder doesn't exist." unless File.exist?(episode_folder)
    
    filename = File.join( episode_folder, name + ".md")
    if File.exist?( filename )
      exit unless "y" == ask( "File #{ filename } already exists. Overwrite? (y/n)", :red )
    end

    # Actual writing
    File.open(filename, 'w') do |episode|
      episode.puts "---"
      episode.puts "name: " + name
      episode.puts "show: " + show
      episode.puts "title: \"#{ title }\""
      episode.puts "date: " + date
      episode.puts "---"
    end

    say "Created new episode '#{ name }' with title '#{ title }' at path #{ filename }, opening...", :green
    
    # Open in editor (right now only on OS X, I think)
    system "open #{ filename }"
  end
end

class PoddingCLI < Thor
  desc "episode COMMAND ARGS", "manage episodes"
  subcommand "episode", EpisodeCLI
end
