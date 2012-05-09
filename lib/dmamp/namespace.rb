module DMAMP
  class Mod
    def initialize(options)
      @@options = options
      @pattern = DMAMP.pattern(options[:pattern])
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
        File.open(@pattern.templatedir + "/" + m, 'r').each_line do |s|
          # Write in new parameters on appropriate lines if there are any
          if s.match(/#\$PARAM/)
            if @@options[:parameters]
              @@options[:parameters].each do |p|
                temp = s.gsub(/PARAM/, p)
                temp.gsub!(/MODNAME/, @modname)
                temp.sub!(/#/, "")
                target.write temp
              end
            else
              ## Does not write template line if no params
              next
            end
          else
            # Otherwise just make sure the module name is correct
            target.write s.gsub(/MODNAME/, @modname)
          end
        end
        target.close
      end
    rescue Errno::EEXIST
      abort @@options[:modulename] + " directory already exists."
    end
  end
end
