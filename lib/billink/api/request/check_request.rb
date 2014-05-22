module Billink
  module Api
    class CheckRequest < Request
      include Billink::Helpers::AttributeAssignment

      attr_accessor :check

      def body
        default_body.merge({
          action:             "Check",
          type:               check.type,
          companyname:        check.company_name,
          chamberofcommerce:  check.kvk_number,
          firstname:          check.first_name,
          lastname:           check.last_name,
          initials:           check.initials,
          housenumber:        check.house_number,
          houseextension:     check.house_number_extension,
          postalcode:         check.postal_code,
          phonenumber:        check.phone_number,
          birthdate:          check.birth_date,
          email:              check.email,
          orderamount:        check.order_amount
        })
      end

      def path
        "check"
      end

    end
  end
end
