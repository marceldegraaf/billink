require "spec_helper"

describe Billink::Workflow do
  context "orders not found", :vcr do
    subject { Fabricate(:workflow) }

    before do
      subject.start
    end

    it "should tell the orders could not be found" do
      subject.success?.should == false
      subject.reason.should =~ /Unknown invoice number:/
    end
  end

  context "orders found" do
  end

  context "error returned" do
  end

  context "request failed" do
  end
end
