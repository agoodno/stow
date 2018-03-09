def printusage(error_code)
    print "distribute_photos.rb -- distribute photos imported from camera to their respective date directories for storage\n"
    print "Usage: distribute_photos [POSIX or GNU style options] dir ...\n\n"
    print "POSIX options                     GNU long options\n"
    print "    -d directory containing unsorted photos...             --extract directory containing unsorted photos...\n"
    print "    -h                                --help\n"
    print "    -u                                --usage\n"
    print "    -v                                --version\n\n"

    print "Examples: \n"
    print "distribute_photos -d /home/andrew/Pictures/2008-11-18--15.09.09    sort photos from a Nov 18 import\n"
    print "Send bug reports to andrew@agoodno.com\n"
    print "For licensing terms, see source code\n"

    exit(error_code)
end

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
#    puts "Vals[0]=#{vals[0]}"
#    puts "Vals[1]=#{vals[1]}"

#    key = vals[0].to_s.strip
#    val = vals[1].to_s.strip
    #puts "Key:#{key}=Val:#{val}"
    #props[key] = val
    if key == 'Date/Time'
      return val.split(' ')[0].gsub(':','-')
    end
  end
#   props.each do |k,v|
#     puts #{k}=#{v}
#   end
  #puts props

  

  #'2008-11-10'
end

dirname = '/home/andrew/Pictures/2008/2008-02-06'
dirname = File.expand_path(dirname)
dirname += "/**/*.JPG"
Dir[dirname].each do |f|
  puts date_taken(f)
end
