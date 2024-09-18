require_relative '../lib/api_client'
require_relative '../models/player'

# @abstract
# This class is the base class for all the leagues.
# It contains the common methods that will be used by all the leagues.
class LeagueBase
  LEAGUE_ID = nil

  def initialize
    raise 'This is an abstract class and should not be instantiated.' if self.class == LeagueBase
  end

  # This method should print the top 10 scorers of the league with their respective clubs and goals.
  # @return [Array<Player>] an array of Player objects
  def top_scorers
    response = ApiClient.new.top_scorers(league_id: self.class::LEAGUE_ID)
    response.first(10).map do |scorer|
      Player.new(name: scorer['player']['name'], goals: scorer['statistics'][0]['goals']['total'], team: scorer['statistics'][0]['team']['name'])
    end
  end

  # @abstract
  # This method should return the ID of the league and should be implemented in the child classes.
  # @return [Integer] ID of the league
  def league_id
    raise NotImplementedError
  end
end
