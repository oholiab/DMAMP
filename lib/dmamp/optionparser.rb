require 'dmamp/defaultargs'

module DMAMP
  # Option parsing class, all options available via
  # the options accessor.
  class Opts
    # Parsed option hash
    attr_accessor :options

    # Parses options from ARGV
    def initialize
      @options = DEFAULTARGS
      op = OptionParser.new do |opts|
        opts.banner = "Usage: dmamp [options] MODULENAME"
  
        opts.on("-p", "--parameters [PARAMS]", String, "Comma seperated list of additional parameter names (default is none)") do |p|
          @options[:parameters] = p.gsub(/ /, "").split(",") if p
        end
        opts.on("-P", "--pattern [PATTERN]", String, "Module pattern to used (defaults to parameterised-PCS)") do |p|
          @options[:pattern] = p if p
        end
      end
      op.parse!
      raise OptionParser::MissingArgument unless ARGV[0]
      @options[:modulename] = ARGV[0]
    rescue OptionParser::MissingArgument
      puts op
      abort "Arguments required"
    end
  end
  # Create and return option hash from DMAMP::Opts
  def self.options
    Opts.new.options
  end
end
