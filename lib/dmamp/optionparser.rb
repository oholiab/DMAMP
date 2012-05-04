require 'optparse'

module DMAMP
  class Opts
    include Singleton
    def self.instance
      @__instance__ ||= new
    end
    def initialize
      @@options = Hash.new
      OptionParser.new do |opts|
        opts.banner = "Usage: dmamp [args] modulename"
  
        opts.on("-p", "--parameters PARAMS", String, "Comma seperated list of additional parameter names") do |p|
          @@options[:parameters] = p.gsub(/ /, "").split(",")
        end
        opts.on("-P", "--pattern PATTERN", String, "Module pattern to used (defaults to parameterised-PCS)") do |p|
          @@options[:pattern] = p
        end
      end.parse!
    end
    def self.options
      self.instance
      return @@options
    end
  end
end
