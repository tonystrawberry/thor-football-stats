require 'dotenv/load'
require_relative 'services/ligue_1'
require_relative 'services/premier_league'
require_relative 'services/la_liga'
require_relative 'services/bundesliga'
require_relative 'services/serie_a'

class FootballStats < Thor
  SUPPORTED_LEAGUES = %w[ligue-1 premier-league bundesliga serie-a la-liga]

  desc "top_scorers", "Prints the top 10 scorers of the Ligue 1 season with their respective clubs and goals."
  long_desc <<-LONGDESC
    `football_stats top_scorers` will print the top 10 scorers of the Ligue 1 season with their respective clubs and goals.

    Example:
      $ football_stats top_scorers --league=premier-league

    Supported leagues are: #{SUPPORTED_LEAGUES.join(', ')}
  LONGDESC
  option :league,
          type: :string,
          required: true,
          aliases: '-l',
          desc: "The league for which you want to see the top scorers. Supported leagues are: #{SUPPORTED_LEAGUES.join(', ')}"
  def top_scorers
    service = initialize_service(league: options[:league])

    service.top_scorers.each_with_index do |scorer, index|
      puts "#{index + 1}. #{scorer.name} | #{scorer.team} | #{scorer.goals} ⚽️"
    end
  end

  private

  def initialize_service(league:)
    if SUPPORTED_LEAGUES.include?(league)
      Object.const_get(league.split('-').map(&:capitalize).join).new
    else
      puts "Unsupported league. Supported leagues are: #{SUPPORTED_LEAGUES.join(', ')}"
      exit
    end
  end
end
