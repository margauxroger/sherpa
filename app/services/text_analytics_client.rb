require 'azure_cognitiveservices_textanalytics'
include Azure::CognitiveServices::TextAnalytics::V2_1::Models

class TextAnalyticsClient

  def initialize(endpoint, key)
    credentials =
        MsRestAzure::CognitiveServicesCredentials.new(key)

    endpoint = String.new(endpoint)

    @textAnalyticsClient = Azure::TextAnalytics::Profiles::Latest::Client.new({
        credentials: credentials
    })
    @textAnalyticsClient.endpoint = endpoint
  end

  def AnalyzeSentiment(inputDocuments)
    result = @textAnalyticsClient.sentiment(
        multi_language_batch_input: inputDocuments
    )

    if (!result.nil? && !result.documents.nil? && result.documents.length > 0)
      puts '===== SENTIMENT ANALYSIS ====='
      result.documents.each do |document|
        puts "Document Id: #{document.id}: Sentiment Score: #{document.score}"
      end
    end
    result.documents.first.score
  end
end
