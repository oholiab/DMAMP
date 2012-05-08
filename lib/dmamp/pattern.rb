PATTERNDIR = File.expand_path(File.dirname(__FILE__)) + "/patterns"

module DMAMP
  class Pattern
    include Singleton
    @@options = Opts.options

    def Pattern.instance
      @@instance ||= new
    end

    attr_reader :name, :manitemplates, :templatedir
    def initialize
      @@name = @@pattern = @@options[:pattern]
      @templatedir = "#{PATTERNDIR}/#{@@pattern}/templates"
      @@knownpatterns = Dir.entries(PATTERNDIR).reject {|x| ["..","."].include?(x)}
      @manitemplates = Dir.entries(templatedir).reject {|x| ["..","."].include?(x)}
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
