module Billink
  module Helpers

    module AttributeAssignment
      def initialize(arguments = {})
        arguments.each do |key, value|
          send("@#{key}=", value)
        end
      end
    end

  end
end
