require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'fileutils'

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
    options.rootdir = "/home/andrew/Pictures/2009"
    options.dryrun = false
    options.verbose = false

    opts = OptionParser.new do |opts|
      opts.banner = "Usage: dist_photos.rb [options]"

      opts.separator ""
      opts.separator "Specific options:"

      # 
      opts.on("-d", "--dir DIR", "directory containing unsorted photos") do |d|
        options.dir = d
      end

      # 
      opts.on("-r", "--rootdir ROOT", "root of dated photos directory") do |r|
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
  f = IO.popen("jhead #{filename}")
  lines = f.readlines
#  puts lines
  props = {}
  lines.each do |line|
    if line == ""
      return
    end
    #puts line
    key = line[0..12].strip
    val = line[14..line.length].strip
    #puts "Key:#{key}=Val:#{val}"
    if key == 'Date/Time'
      return val.split(' ')[0].gsub(':','-')
    end
  end
end

options = Optparser.parse(ARGV)
pp options

#Dir.chdir(options.rootdir)

dirsrch = File.expand_path(options.dir) + "/**/*.jpg"
Dir[dirsrch].sort.each do |f|
  datestr = date_taken(f)
  destdir = options.rootdir + "/" + datestr
  begin
    Dir.mkdir(destdir)
  rescue
    #puts "Dir #{destdir} already exists, moving on"
  end
  FileUtils.mv f, destdir, :noop => options.dryrun, :verbose => options.verbose
end
