module Billink
  class OrderItem
    include Billink::Helpers::AttributeAssignment

    attr_accessor :code, :description, :order_quantity, :item_quantity, :price_without_vat,
                  :price_with_vat, :vat_percentage

    def api_fields
      {
        code:           code,
        description:    description,
        orderquantity:  order_quantity,
        item_quantity:  item_quantity,
        priceexcl:      price_without_vat,
        priceincl:      price_with_vat,
        btw:            vat_percentage
      }
    end

  end
end
