require 'faraday'

# API wrapper for the football API.
# This class should be used to make requests to the football API.
# The API documentation can be found here: https://www.api-football.com/documentation-v3
class ApiClient
  def initialize
    @client = Faraday.new(url: 'https://v3.football.api-sports.io') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.use Faraday::Response::RaiseError
      faraday.headers['x-rapidapi-host'] = 'v3.football.api-sports.io'
      faraday.headers['x-rapidapi-key'] = ENV['API_KEY']
    end
  end

  # This method should return the top scorers of the league.
  # @param league_id [Integer] ID of the league | Can be found in the API documentation: https://dashboard.api-football.com/soccer/ids
  # @return [Array<Hash>] Array of hashes containing the top scorers of the league
  def top_scorers(league_id:)
    response = @client.get("/players/topscorers?season=2022&league=#{league_id}")
    JSON.parse(response.body)["response"]
  end
end
