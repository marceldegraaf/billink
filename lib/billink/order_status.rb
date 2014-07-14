module Billink
  class OrderStatus
    include Billink::Helpers::AttributeAssignment

    attr_accessor :description, :order_number, :status

    def paid?
      status.to_i == 1
    end

    def human_status
      case status.to_i
        when -1; "Order not found"
        when 0;  "Not paid"
        when 1;  "Paid"
        when 2;  "Pending direct debit"
      end
    end

  end
end
