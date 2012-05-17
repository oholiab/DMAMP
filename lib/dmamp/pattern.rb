require 'singleton'

module DMAMP
  # Helper for loading the appropriate metadata for the 
  # given pattern by reading from the appropriate directories
  # including readers for the pattern name, the templates
  # and the templates directory.
  class Pattern
    # Default pattern directory
    PATTERNDIR = File.expand_path(File.dirname(__FILE__)) + "/patterns"
    include Singleton

    # Return the instance of Pattern if it exists, else instantiate
    # it
    def Pattern.instance(name)
      @instance ||= new(name)
    end

    # Module name
    attr_reader :name
    # Manifest template filenames
    attr_reader :manitemplates
    # Template directory (currently defined inline from default constant,
    # no way of changing this from the command line yet... TODO)
    attr_reader :templatedir

    # Instantiate pattern class and acquire metadata for pattern from
    # the appropriate pattern's template directory. Will abort if the
    # name given does not match a pattern directory giving a list of
    # known patterns.
    def initialize(name)
      @name = @pattern = name
      @templatedir = "#{PATTERNDIR}/#{@pattern}/templates"
      @knownpatterns = Dir.entries(PATTERNDIR).reject {|x| ["..","."].include?(x)}
      @manitemplates = Dir.entries(templatedir).reject {|x| ["..","."].include?(x)}
    rescue Errno::ENOENT => e
      abort "Pattern #{@pattern} is not defined within the patterns directory #{PATTERNDIR}
      Known patterns are:
      #{@knownpatterns.join("\n")}"
    end
  end

  # Pretty much just a module level alias for Pattern.instance
  def self.pattern(name)
    Pattern.instance(name)
  end
end
