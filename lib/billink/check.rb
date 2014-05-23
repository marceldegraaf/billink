module Billink
  class Check
    include Billink::Helpers::AttributeAssignment

    attr_accessor :type, :company_name, :kvk_number, :first_name, :last_name, :initials,
                  :house_number, :house_number_extension, :postal_code, :phone_number,
                  :birth_date, :email, :order_amount

    def perform
      Billink.log("Performing check (company name: #{company_name}, kvk number: #{kvk_number})")

      if response.success?
        @result = response.description == "Advies=1"
      else
        Billink.log("Billink API returned an error: #{response.description}")
        @result = false
      end

    rescue => e
      Billink.log("Billink API request failed: #{e.message}")
      @result = false

    end

    def positive?
      @result == true
    end

    def negative?
      @result != true
    end

    private

    def response
      @response ||= Billink::Api::Response.new(response: check_request.perform)
    end

    def check_request
      @check_request ||= Billink::Api::CheckRequest.new(check: self)
    end

  end
end
