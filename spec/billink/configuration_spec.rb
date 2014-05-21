require "spec_helper"

describe Billink::Configuration do

  subject { Billink::Configuration.new }

  it "should not be in debug mode" do
    subject.debug_mode?.should == false
  end

end
