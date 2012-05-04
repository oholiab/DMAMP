PATTERNDIR = "patterns"

module DMAMP
  class Pattern
    include Singleton
    @@options = Opts.options

    def self.instance
      @__instance__ ||= new
    end

    attr_reader :name, :manitemplates

    def initialize
      @@name = @@pattern = @@options[:pattern]
      templatedir = "#{PATTERNDIR}/#{@@pattern}/templates"
      @@knownpatterns = Dir.entries(PATTERNDIR).reject {|x| ["..","."].include?(x)}
      @@manitemplates = Dir.entries(templatedir).reject {|x| ["..","."].include?(x)}
    rescue Errno::ENOENT => e
      abort "Pattern #{@@pattern} is not defined within the patterns directory #{PATTERNDIR}
      Known patterns are:
      #{@@knownpatterns.join("\n")}"
    end
  
  end

  def self.pattern
    Pattern.instance
  end
end
