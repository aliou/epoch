#!/usr/bin/env ruby

require 'optparse'
require 'chronic'

options = {
  :unix => true,
}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: epoch [options] [date]"

  opts.separator ""
  opts.separator "Options:"

  opts.on("-u", "--unix", "Prints the current time or the argument to unix time (seconds since 1/1/70)") do |unix|
    options[:unix] = true
  end

  opts.on("-h", "--human", "Prints the current time in human form") do |human|
    options[:unix] = false
  end

  opts.on("--help", "Show this message") do 
    puts opts
    exit
  end
end

parser.parse!

if options[:unix]
  date = (ARGV.empty?) ? DateTime.now : Chronic.parse((ARGV.join " "), :context => :past)
  fmt = "%s"
else
  date = (ARGV.empty?) ? DateTime.now : DateTime.strptime(ARGV.first, "%s")
  fmt = "%+"
end

puts date.strftime(fmt)
