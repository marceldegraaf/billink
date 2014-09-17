module Billink
  module Api
    class OrderRequest < Request
      include Billink::Helpers::AttributeAssignment

      attr_accessor :order

      def body
        default_body.
          merge(order_api_fields).
          merge(order.client.api_fields).
          merge(order.delivery_address.api_fields).
          merge(order_items_api_fields)
      end

      def path
        "order"
      end

      private

      def order_api_fields
        {
          action: "Order",
          ordernumber: order.number,
          type: Billink.configuration.type_code,
          date: Date.today.strftime("%d-%m-%Y"),
          workflownumber: Billink.configuration.workflow_id,
          checkuuid: order.check_uuid
        }
      end

      def order_items_api_fields
        {
          orderitems: {
            item: order.order_items.map do |order_item|
              order_item.api_fields.capitalize_keys
            end
          }
        }
      end

    end
  end
end
