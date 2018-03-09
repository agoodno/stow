require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'fileutils'
require 'open3'
require 'date'

include FileUtils

class Optparser

  #
  # Return a structure describing the options.
  #
  def self.parse(args)
    # The options specified on the command line will be collected in *options*.
    # We set default values here.
    options = OpenStruct.new
    options.dir = "."
    options.rootdir = "/home/andrew/Pictures"
    options.dryrun = false
    options.verbose = false

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: dist_videos.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      # 
      opts.on("-d", "--dir DIR", "directory containing unsorted videos") do |d|
        options.dir = d
      end

      # 
      opts.on("-r", "--rootdir ROOT", "root of dated videos directory") do |r|
        options.rootdir = r
      end

      # 
      opts.on("-u", "--[no-]dry-run", "Run a test, do nothing else") do |u|
        options.dryrun = u
      end

      # 
      opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
        options.verbose = v
      end

      opts.separator ""
      opts.separator "Common options:"

      # No argument, shows at tail.  This will print an options summary.
      # Try it and see!
      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      # Another typical switch to print the version.
      opts.on_tail("--version", "Show version") do
        puts OptionParser::Version.join('.')
        exit
      end
    end

    opts.parse!(args)
    options
  end  # parse()

end  # class Optparser

def date_taken(filename)
  command  = "mplayer -vo null -ao null -frames 0 -identify #{filename}"
  metadata = nil

  Open3.popen3(command) do |input, output, error|
    metadata = output.readlines.grep(/ID_.*/).collect {|name| name[3..name.length].split('=')}
    metadata = metadata.inject({}) {|hash, (key, value)| hash[key.to_sym] = value.chomp; hash}
  end
  #puts metadata[:CLIP_INFO_NAME0]
  #puts metadata[:CLIP_INFO_VALUE0]
  datestr = metadata[:CLIP_INFO_VALUE0]
  #d = DateTime.strptime("Fri Sep 04 18:01:15 2009", "%a %b %d %H:%M:%S %Y")
  d = DateTime.strptime(datestr, "%a %b %d %H:%M:%S %Y")
end

options = Optparser.parse(ARGV)
#pp options

#Dir.chdir(options.rootdir)

dirsrch = File.expand_path(options.dir) + "/**/*.MOV"
Dir[dirsrch].sort.each do |video_file|
  dtaken = date_taken(video_file)
  picsdir = dtaken.strftime("%Y")
  datedir = dtaken.strftime("%Y-%m-%d")
  destdir = options.rootdir + "/" + picsdir + "/" + datedir
  #puts "destdir=" + destdir
  begin
    Dir.mkdir(destdir)
  rescue
    #puts "Dir #{destdir} already exists, moving on"
  end
  FileUtils.mv video_file, destdir, :noop => options.dryrun, :verbose => options.verbose
end
