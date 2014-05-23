require "spec_helper"

describe Billink::Check do
  use_vcr_cassette

  subject {
    Billink::Check.new(
      type: "P",
      company_name: "Acme Corp.",
      kvk_number: "01234567",
      first_name: "John",
      last_name: "Doe",
      initials: "J.A.",
      house_number: "1",
      house_number_extension: "",
      postal_code: "1234AB",
      phone_number: "0612345678",
      birth_date: "01-01-1990",
      email: "john@example.com",
      order_amount: "1"
    )
  }

  context "successful requests" do
    it "should fetch the result" do
      subject.perform
    end

    it "should be succesful" do
      subject.perform.should == true
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
      subject.perform.should == false
    end

    it "should rescue the exception" do
      lambda { subject.perform }.should_not raise_exception
    end

    it "should log the exception" do
      Billink.should_receive(:log).with(/undefined method .* for nil/)

      subject.perform
    end
  end

end
