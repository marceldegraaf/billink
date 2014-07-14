module Billink
  module Api
    class StatusRequest < Request
      include Billink::Helpers::AttributeAssignment

      attr_accessor :status

      def body
        default_body.
          merge({ action: "Status" }).
          merge(status_api_fields)
      end

      def path
        "status"
      end

      def status_api_fields
        {
          invoices: {
            item: status.order_numbers.map do |order_number|
              {
                workflownumber: Billink.configuration.workflow_id,
                invoicenumber: order_number
              }
            end.flatten.compact.uniq
          }
        }
      end

    end
  end
end
