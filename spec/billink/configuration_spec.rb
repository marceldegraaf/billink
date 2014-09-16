require "spec_helper"

describe Billink::Configuration do

  subject { Billink::Configuration.new }

  it "should not be in debug mode" do
    subject.debug_mode?.should == false
  end

  it "should enable debug mode" do
    subject.debug_mode = true
    subject.debug_mode?.should == true

    HTTPI.log_level.should == :debug
  end

  it "should disable debug mode" do
    subject.debug_mode = false
    subject.debug_mode?.should == false

    HTTPI.log_level.should == :info
  end

  it "should set test mode" do
    subject.test_mode = true
    subject.test_mode?.should == true
  end

  it "should set the business type code" do
    subject.customer_type = :business
    subject.type_code.should == "B"
  end

  it "should set the consumer type code" do
    subject.customer_type = :consumer
    subject.type_code.should == "P"
  end

  it "should have a default type code" do
    subject.customer_type = nil
    subject.type_code.should == "P"
  end

end
