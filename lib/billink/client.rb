module Billink
  class Client
    include Billink::Helpers::AttributeAssignment

    attr_accessor :company_name, :kvk_number, :first_name, :last_name, :initials, :sex,
                  :street, :house_number, :house_number_extension, :postal_code, :phone_number,
                  :birth_date, :email, :order_amount, :country_code, :city

    def api_fields
      {
        companyname:        company_name,
        chamberofcommerce:  kvk_number,
        firstname:          first_name,
        lastname:           last_name,
        initials:           initials,
        sex:                sex,
        street:             street,
        city:               city,
        housenumber:        house_number,
        houseextension:     house_number_extension,
        postalcode:         postal_code,
        phonenumber:        phone_number,
        birthdate:          birth_date,
        email:              email,
        orderamount:        order_amount
      }
    end

  end
end
