module Billink
  class Check
    include Billink::Helpers::AttributeAssignment

    attr_accessor :client, :uuid

    def perform
      Billink.log("Performing check (company name: #{client.company_name}, kvk number: #{client.kvk_number})")

      if response.success?
        @result = response.description == "Advies=1"
        @uuid = response.uuid
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
