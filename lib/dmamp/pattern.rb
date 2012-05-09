PATTERNDIR = File.expand_path(File.dirname(__FILE__)) + "/patterns"

module DMAMP
  class Pattern
    include Singleton

    def Pattern.instance(name)
      @instance ||= new(name)
    end

    attr_reader :name, :manitemplates, :templatedir
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

  def self.pattern(name)
    Pattern.instance(name)
  end
end
