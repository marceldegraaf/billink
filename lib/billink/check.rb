module Billink
  class Check
    include Billink::Helpers::AttributeAssignment

    attr_accessor :type, :company_name, :kvk_number, :first_name, :last_name, :initials,
                  :house_number, :house_number_extension, :postal_code, :phone_number,
                  :birth_date, :email, :order_amount

    def perform
      response = check_request.perform

      response.API.MSG.DESCRIPTION == "Advies=1"

    rescue
      false

    end

    private

    def check_request
      @check_request ||= Billink::Api::CheckRequest.new(check: self)
    end

  end
end
