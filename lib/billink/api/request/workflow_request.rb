module Billink
  module Api
    class WorkflowRequest < Request
      include Billink::Helpers::AttributeAssignment

      attr_accessor :workflow

      def body
        default_body.
          merge({ action: "activate order" }).
          merge(workflow_orders_fields)
      end

      def path
        "start-workflow"
      end

      private

      def workflow_orders_fields
        {
          invoices: {
            item: workflow.order_numbers.map do |order_number|
              {
                invoicenumber: order_number,
                workflownumber: Billink.configuration.workflow_id
              }.capitalize_keys
            end
          }
        }
      end

    end
  end
end
