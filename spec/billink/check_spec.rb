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

end
