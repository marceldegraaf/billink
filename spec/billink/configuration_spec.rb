require "spec_helper"

describe Billink::Configuration do

  subject { Billink::Configuration.new }

  it "should not be in debug mode" do
    subject.debug_mode?.should == false
  end

  it "should set debug mode" do
    subject.debug_mode = true
    subject.debug_mode?.should == true

    HTTPI.log_level.should == :debug
  end

  it "should set test mode" do
    subject.test_mode = true
    subject.test_mode?.should == true
  end

end
