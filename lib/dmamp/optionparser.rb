require 'optparse'

module DMAMP
  class Opts
    include Singleton
    def self.instance
      @__instance__ ||= new
    end
    def initialize
      @@options = Hash.new
      op = OptionParser.new do |opts|
        opts.banner = "Usage: dmamp [options] MODULENAME"
  
        opts.on("-p", "--parameters PARAMS", String, "Comma seperated list of additional parameter names (default is none)") do |p|
          @@options[:parameters] = p.gsub(/ /, "").split(",")
        end
        opts.on("-P", "--pattern PATTERN", String, "Module pattern to used (defaults to parameterised-PCS)") do |p|
          @@options[:pattern] = p
        end
      end
      op.parse!
      raise OptionParser::MissingArgument unless ARGV[0]
      @@options[:modulename] = ARGV[0]
    rescue OptionParser::MissingArgument
      puts op
      abort "Arguments required"
    end
    def self.options
      self.instance
      return @@options
    end
  end
end
