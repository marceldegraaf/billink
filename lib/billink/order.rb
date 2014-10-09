module Billink
  class Order
    include Billink::Helpers::AttributeAssignment

    attr_accessor :check_uuid, :number, :client, :order_items, :delivery_address, :additional_text, :reason

    def submit
      Billink.log("Submitting order (check UUID: #{check_uuid})")

      if response.success?
        @reason = ""
        @result = response.code == 200
      else
        Billink.log("Billink API returned an error: #{response.description}")
        @reason = response.description
        @result = false
      end

    rescue => e
      Billink.log("Billink API request failed: #{e.message}")
      Billink.log_exception(e)

      @reason = e.message
      @result = false

    end

    def success?
      @result == true
    end

    private

    def response
      @response ||= Billink::Api::Response.new(response: order_request.perform)
    end

    def order_request
      @order_request ||= Billink::Api::OrderRequest.new(order: self)
    end

  end
end
