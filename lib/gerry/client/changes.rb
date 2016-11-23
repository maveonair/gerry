module Gerry
  ReviewInput = Struct.new(:message, :labels, :comments, :strict_labels, :drafts, :notify, :on_behalf_of)
  class Client
    module Changes
      # Get changes visible to the caller.
      #
      # @param [Array] options the query parameters.
      # @return [Hash] the changes.
      def changes(options = [])
        url = '/changes/'
        
        if options.empty?
          return get(url)
        end
        
        options = map_options(options)
        get("#{url}?#{options}")        
      end

      def review(change, revision, input)
        url = "/changes/#{change}/revisions/#{revision}/review"
        post(url, input)
      end
    end
  end
end
