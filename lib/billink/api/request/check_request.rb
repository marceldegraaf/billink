module Billink
  module Api
    class CheckRequest < Request
      include Billink::Helpers::AttributeAssignment

      attr_accessor :check

      def body
        default_body.
          merge({ action: "Check", type: Billink.configuration.type_code }).
          merge(check.client.api_fields)
      end

      def path
        "check"
      end

    end
  end
end
