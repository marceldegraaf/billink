require "spec_helper"

describe Billink::Status do
  context "orders not found", :vcr do
    subject { Fabricate(:status) }

    before do
      subject.check
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
