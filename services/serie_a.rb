require_relative './league_base'

class SerieA < LeagueBase
  LEAGUE_ID = 135

  def self.league_id
    LEAGUE_ID
  end
end
