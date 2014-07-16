require "spec_helper"

describe Billink::Check do
  subject { Fabricate(:check) }

  before do
    Billink.should_receive(:log).with(/Performing check/).and_call_original
  end

  context "positive result", :vcr do
    it "should fetch the result" do
      subject.perform
    end

    it "should be positive" do
      subject.perform
      subject.positive?.should == true
      subject.uuid.should_not be_nil
      subject.uuid.should_not == ""
    end
  end

  context "negative result" do
    let!(:response) { double(:response, uuid: "11-22-33-44") }

    before do
      subject.stub(:response).and_return(response)
      response.stub(:success?).and_return(true)
      response.stub(:description).and_return("Advies=0")
    end

    it "should be negative" do
      subject.perform
      subject.positive?.should == false
    end
  end

  context "error in the response" do
    let!(:response) { double(:response) }

    before do
      subject.stub(:response).and_return(response)
      response.stub(:success?).and_return(false)
      response.stub(:description).and_return("This is an error")
    end

    it "should be negative" do
      Billink.should_receive(:log).with(/Billink API returned an error/).and_call_original

      subject.perform
      subject.negative?.should == true
      subject.reason.should == "This is an error"
    end
  end

  context "failing requests" do
    let!(:check_request) { double(:check_request) }
    let!(:response) { Hashie::Mash.new }

    before do
      check_request.stub(:perform).and_return(response)
      subject.stub(:check_request).and_return(check_request)
    end

    it "should return false" do
      Billink.should_receive(:log).with(/Billink API request failed/).and_call_original
      subject.perform.should == false
    end

    it "should rescue the exception" do
      Billink.should_receive(:log).with(/Billink API request failed/).and_call_original
      lambda { subject.perform }.should_not raise_exception
    end

    it "should log the exception" do
      Billink.should_receive(:log).with(/undefined method .* for nil/).and_call_original

      subject.perform
    end
  end

end
