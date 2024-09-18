
# Represents a football player
class Player
  attr_reader :name, :goals, :team

  def initialize(name:, goals:, team:)
    @name = name
    @goals = goals
    @team = team
  end
end
