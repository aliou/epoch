#!/usr/bin/env ruby

require 'optparse'
require 'date'

options = {
  :unix => true,
  :human => false
}

parser = OptionParser.new do |opts|
  opts.banner = "Usage: epoch [options] [date]"

  opts.separator ""
  opts.separator "Options:"

  opts.on("-u", "--unix", "Prints the current time or the argiment to unix time (seconds since 1/1/70)") do |unix|
    options[:unix] = true
  end

  opts.on("-h", "--human", "Prints the current time in human form") do |human|
    options[:human] = true
    options[:unix] = false
  end

  opts.on("--help", "Show this message") do 
    puts opts
    exit
  end
end

parser.parse!
