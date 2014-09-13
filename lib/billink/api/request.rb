module Billink
  module Api
    class Request

      ENDPOINT = "http://test.billink.nl/api"

      def perform
        request = HTTPI::Request.new(url)
        request.body = body_to_xml
        request.headers = { "Content-Type" => "text/xml" }

        response = HTTPI.post(request)
        parsed_response = Crack::XML.parse(response.body)

        if Billink.configuration.debug_mode?
          Billink.log("RESPONSE XML:  #{response.body}")
          Billink.log("RESPONSE HASH: #{parsed_response}")
        end

        Hashie::Mash.new(parsed_response)
      end

      def default_body
        {
          version:        "BILLINK2.0",
          clientusername: Billink.configuration.user_name,
          clientid:       Billink.configuration.user_id,
          workflownumber: Billink.configuration.workflow_id
        }
      end

      def body; raise 'Implement me in a subclass'; end
      def path; raise 'Implement me in a subclass'; end

      private

      def url
        [ ENDPOINT, path ].join("/")
      end

      def body_to_xml
        xml = Gyoku.xml({ "API" => body.capitalize_keys })

        if Billink.configuration.debug_mode?
          Billink.log("REQUEST HASH: #{body}")
          Billink.log("REQUEST XML:  #{xml}")
        end

        xml
      end

    end
  end
end
