module Gerry
  class Client
    module Request
      # Get the mapped options.
      #
      # @param [Array] options the query paramters.
      # @return [String] the mapped options.
      def map_options(options)
        options.map{|v| "#{v}"}.join('&')
      end

      class RequestError < StandardError
      end

      def get(url)
        if @username && @password
          auth = { username: @username, password: @password }
          response = self.class.get("/a#{url}", digest_auth: auth)
          parse(response)
        else
          response = self.class.get(url)
          parse(response)
        end
      end

      def post(url, data)
        options = { :headers => { 'Content-Type' => 'application/json' }, :body => data.to_json }
        if @username && @password
          auth = { username: @username, password: @password }
          response = self.class.post("/a#{url}", options.merge({:digest_auth => auth }))
          parse(response)
        else
          response = self.class.post(url, options)
          parse(response)
        end
      end

      private
      def parse(response)
        unless response.code.eql?(200)
          raise_request_error(response)
        end

        JSON.parse(remove_magic_prefix(response.body))
      end

      def raise_request_error(response)
        body = response.body
        raise RequestError.new("There was a request error! Response was: #{body}")
      end

      def remove_magic_prefix(response_body)
        response_body.lines.to_a[1..-1].join
      end
    end
  end
end