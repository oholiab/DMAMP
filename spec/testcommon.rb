require 'rubygems'

$: << File.join(File.dirname(__FILE__), "..", "lib")
require 'dmamp/defaultargs'

# Dummy Opts class as optionparser does not play well with testing

module DMAMP
  class Opts
    attr_accessor :options
    def initialize
      @options = DEFAULTARGS.merge({:modulename => "temp"})
    end
  end
end

# Helper functions
def clean
  if File.directory?("temp")
    system("rm -rf temp") 
  end
end
