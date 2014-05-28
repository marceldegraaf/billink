module Billink
  class DeliveryAddress
    include Billink::Helpers::AttributeAssignment

    attr_accessor :street, :house_number, :house_number_extension, :postal_code, :country_code,
                  :city, :company_name, :first_name, :last_name

    def api_fields
      {
        deliverystreet:               street,
        deliveryhousenumber:          house_number,
        deliveryhousenumberextension: house_number_extension,
        deliverypostalcode:           postal_code,
        deliverycountrycode:          country_code,
        deliverycity:                 city,
        deliveryaddresscompanyname:   company_name,
        deliveryaddressfirstname:     first_name,
        deliveryaddresslastname:      last_name
      }
    end

  end
end
