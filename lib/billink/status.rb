module Billink
  class Status
    include Billink::Helpers::AttributeAssignment

    attr_accessor :order_numbers

    def check
      Billink.log("Checking status (order numbers: #{order_numbers.join(', ')})")

      if response.success?
        @result = response.orders
      else
        Billink.log("Billink API returned an error: #{response.description}")
        @result = []
      end

    rescue => e
      Billink.log("Billink API request failed: #{e.message}")
      @result = []

    end

    def order_statuses
      @result
    end

    private

    def response
      @response ||= Billink::Api::StatusResponse.new(response: status_request.perform)
    end

    def status_request
      @status_request ||= Billink::Api::StatusRequest.new(status: self)
    end
  end
end
