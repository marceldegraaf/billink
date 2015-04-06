module Billink
  class Workflow
    include Billink::Helpers::AttributeAssignment

    attr_accessor :order_numbers, :reason

    def start
      Billink.log("Starting workflow for orders: #{order_numbers.join(', ')}")

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
      @reason = e.message
      @result = false

    end

    def success?
      @result == true
    end

    private

    def response
      @response ||= Billink::Api::Response.new(response: workflow_request.perform)
    end

    def workflow_request
      @workflow_request ||= Billink::Api::WorkflowRequest.new(workflow: self)
    end

  end
end
