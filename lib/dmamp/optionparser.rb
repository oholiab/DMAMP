
module DMAMP
  class Opts
    include Singleton

    @@defaults = {:pattern => "parameterised-PCS",
                  :parameters  => nil,
    }
    def self.instance
      @__instance__ ||= new
    end
    def initialize
      @@options = @@defaults
      op = OptionParser.new do |opts|
        opts.banner = "Usage: dmamp [options] MODULENAME"
  
        opts.on("-p", "--parameters [PARAMS]", String, "Comma seperated list of additional parameter names (default is none)") do |p|
          @@options[:parameters] = p.gsub(/ /, "").split(",") if p
        end
        opts.on("-P", "--pattern [PATTERN]", String, "Module pattern to used (defaults to parameterised-PCS)") do |p|
          @@options[:pattern] = p if p
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
