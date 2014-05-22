module Billink
  module Helpers

    module AttributeAssignment
      def initialize(attributes = {})
        (attributes || {}).each do |key, value|
          send("#{key}=", value) if respond_to?("#{key}=")
        end
      end
    end

  end
end
