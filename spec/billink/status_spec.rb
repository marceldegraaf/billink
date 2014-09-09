require "spec_helper"

describe Billink::Status do
  context "orders not found", :vcr do
    subject { Fabricate(:status) }

    before do
      Billink.should_receive(:log).with(/Checking status \(order numbers:/).and_call_original
      subject.check
    end

    it "should fetch the result" do
      subject.order_statuses.should_not be_empty
    end

    it "should tell the orders could not be found" do
      subject.order_statuses.map(&:human_status).uniq.should == [ "Order not found" ]
    end
  end

  context "orders found" do
  end

  context "error returned" do
  end

  context "request failed" do
  end
end
