require 'testcommon'
require 'dmamp/defaultargs'

# This test is only to test that the fake Opts class approximates to the real one
# and won't screw up the rest of the testing!

describe DMAMP::Opts do
  describe "#options" do
    before :all do
      @opt = DMAMP::Opts.new
      @options = @opt.options
    end

    it "should be a hash" do
      @options.should be_an_instance_of Hash
    end

    it "should have string values for :pattern" do
      @options[:pattern].should be_an_instance_of String
    end

    it "should have string values for :modulename" do
      @options[:modulename].should be_an_instance_of String
    end
  end
end

