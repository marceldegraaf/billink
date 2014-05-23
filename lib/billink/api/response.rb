module Billink
  module Api
    class Response
      include Billink::Helpers::AttributeAssignment

      attr_accessor :response

      def success?
        response_container == "MSG"
      end

      def description
        parsed_response.send(response_container).DESCRIPTION
      end

      private

      def parsed_response
        @parsed_response ||= response.API
      end

      def response_container
        parsed_response.RESULT
      end

    end
  end
end
