require 'testcommon'
require 'dmamp/mod'
require 'dmamp/pattern'

describe DMAMP::Mod do
  describe "#build" do

    before :each do
      # Clean test directory
      clean
      @mod = DMAMP::Mod.new(DMAMP::Opts.new.options)
    end
    after :each do
      clean
    end

    it "should create directory containing .pp files" do
      File.directory?("temp").should be_true
      @createdfiles = Dir.entries("temp").reject {|x| ["..","."].include?(x)}
      @createdfiles.should == @mod.pattern.manitemplates
    end

    it "should fail when run twice" do
      lambda { @mod.build }.should raise_error SystemExit
    end

    context "when parameters are given" do
      before :all do
        @testparams = ["bloo","blah"] 
        @mod = DMAMP::Mod.new(DMAMP::Opts.new.options)
        @mod.options.merge({:parameters => @testparams})
      end

      it "should include new parameters in at least one of the files" do
        success = false
        @createdfiles = Dir.entries("temp").reject {|x| ["..","."].include?(x)}
        @createdfiles.each do |f|
          success = true if File.read("temp/" + f){|line| break if l.match(Regexp.new(@testparams.join("|")))}
        end
        success.should be true
      end
    end
  end
end 
