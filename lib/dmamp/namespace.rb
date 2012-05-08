module DMAMP
  class Mod
    def initialize
      @@options = Opts.options
      @pattern = DMAMP.pattern
      @modname = @@options[:modulename]
      self.build
    end
    def build
      dir = Dir::pwd + "/" + @modname
      if FileTest::directory?(dir)
        abort @@options[:modulename] + " directory already exists."
      end

      Dir::mkdir(dir)
      @pattern.manitemplates.each do |m|
        target = File.open(dir + "/" + m, 'a')
        puts @pattern.templatedir + "/" + m, 'r'
        File.open(@pattern.templatedir + "/" + m, 'r').each_line do |s|
          target.write s.gsub(/MODNAME/, @modname)
        end
        target.close
      end
    rescue Errno::EEXIST
      abort @@options[:modulename] + " directory already exists."
    end
  end
end
