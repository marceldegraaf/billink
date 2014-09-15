require "spec_helper"

describe Billink::Order do

  before do
    check = Fabricate(:check)
    check.perform
    @uuid = check.uuid
  end

  subject { Fabricate(:order, check_uuid: @uuid) }

  context "successful request", :vcr do
    it "should return a success status" do
      subject.submit
      subject.success?.should == true
    end
  end

  context "request with errors", :vcr do
    it "should log the error" do
      @uuid = nil

      subject.submit
      subject.success?.should == false
    end
  end

  context "failing requests" do
    let!(:order_request) { double(:order_request) }
    let!(:response) { Hashie::Mash.new }

    before do
      order_request.stub(:perform).and_return(response)
      subject.stub(:order_request).and_return(order_request)
    end

    it "should return false" do
      subject.submit.should == false
    end

  end

end
