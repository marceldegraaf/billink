require "spec_helper"

describe Billink::OrderStatus do
  context "not found" do
    subject { Fabricate(:order_status, status: "-1") }

    it "should report correctly" do
      subject.paid?.should == false
      subject.human_status.should == "Order not found"
    end
  end

  context "not paid" do
    subject { Fabricate(:order_status, status: "0") }

    it "should report correctly" do
      subject.paid?.should == false
      subject.human_status.should == "Not paid"
    end
  end

  context "paid" do
    subject { Fabricate(:order_status, status: "1") }

    it "should report correctly" do
      subject.paid?.should == true
      subject.human_status.should == "Paid"
    end
  end

  context "pending" do
    subject { Fabricate(:order_status, status: "2") }

    it "should report correctly" do
      subject.paid?.should == false
      subject.human_status.should == "Pending direct debit"
    end
  end

end
