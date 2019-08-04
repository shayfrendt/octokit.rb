require 'helper'

describe Octokit::Client::ContentAttachments do
  before(:each) do
    Octokit.reset!
    @jwt_client = Octokit::Client.new(:bearer_token => new_jwt_token)
    use_vcr_placeholder_for(@jwt_client.bearer_token, '<JWT_BEARER_TOKEN>')
  end

  after(:each) do
    Octokit.reset!
  end

  describe ".create_content_attachment", :vcr do
    it "creates a content attachment for the content reference" do
      attachment = @jwt_client.create_content_attachment(7, "Movie night", "Here's what's playing")
      expect(attachment).to be_kind_of Sawyer::Resource
      assert_requested :post, github_url("/content_references/7/attachments")
    end
  end
end
