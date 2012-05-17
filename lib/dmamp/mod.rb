# Dun Me A Module Please puppet module templater
module DMAMP
  # Umbrella class that gets the pattern and builds upon
  # instantiation.
  class Mod
    # The pattern that the created module is using
    attr_reader :pattern
    # The name of the new module
    attr_reader :modname
    # The option hash
    attr_accessor :options

    # Instatiates, gathers pattern metadata and then calls
    # self.build to create the new module.
    # +options+ - optparser option hash.
    #
    # ==== Options
    # Must contain at least entries for keys
    # * :pattern
    # * :modulename
    def initialize(options)
      @options = options
      @pattern = DMAMP.pattern(options[:pattern])
      @modname = @options[:modulename]
      self.build
    end
    # Tests whether module directory exists, then  writes
    # in files from template replacing placeholder variables
    # and inserting extra parameters based on the template
    # formatting. Quite literally builds the new module.
    #
    # Will abort (gracefully) if the target directory already
    # exists.
    def build
      dir = Dir::pwd + "/" + @modname
      if FileTest::directory?(dir)
        abort @options[:modulename] + " directory already exists."
      end

      Dir::mkdir(dir)
      @pattern.manitemplates.each do |m|
        target = File.open(dir + "/" + m, 'a')
        File.open(@pattern.templatedir + "/" + m, 'r').each_line do |s|
          # Write in new parameters on appropriate lines if there are any
          if s.match(/#\$PARAM/)
            if @options[:parameters]
              @options[:parameters].each do |p|
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
      abort @options[:modulename] + " directory already exists."
    end
  end
end
