module Gerry
  class Client
    module Accounts
      # Get the global capabilities that are enabled for the calling user.
      #
      # @param [Array] options the query parameters.
      # @return [Hash] the account capabilities.
      def account_capabilities(options = [])
        url = '/accounts/self/capabilities'
        
        if options.empty?
          return get(url)
        end
        
        options = map_options(options)
        get("#{url}?#{options}")
      end
    end
  end
end