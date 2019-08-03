module Octokit
  class Client

    # Methods for the Content Attachments API
    #
    # @see https://developer.github.com/v3/apps/installations/#create-a-content-attachment
    module ContentAttachments

      # Create a content attachment
      #
      # @param content_reference_id [Integer] Id of the content reference event
      # @param title [String] A descriptive title for the attachment
      # @param body [String] The content for the attachment
      # @return [Sawyer::Resource] The new content attachment
      # @see https://developer.github.com/v3/apps/installations/#create-a-content-attachment
      # @example Create a content attachment
      #   attachment = Octokit.create_content_attachment(42, "The call of the Octocat", "This book began as a...")
      #   attachment.title # => "The call of the Octocat"
      #   attachment.body  # => "This book began as a..."
      def create_content_attachment(content_reference_id, title, body, options = {})
        params - {
          :title => title,
          :body => body
        }
        post "/content_references/#{content_reference_id}/attachments", options.merge(params)
      end
    end
  end
end
