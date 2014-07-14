module Billink
  module Api
    class StatusResponse < Response
      include Billink::Helpers::AttributeAssignment

      def orders
        @orders ||= Array.new(orders_from_response.INVOICE).flatten.map do |order|
          Billink::OrderStatus.new(
            description: order.DESCRIPTION,
            order_number: order.INVOICENUMBER,
            status: order.STATUS
          )
        end
      end

      private

      def orders_from_response
        @orders_from_response ||= parsed_response.send(response_container).INVOICES
      end

    end
  end
end
