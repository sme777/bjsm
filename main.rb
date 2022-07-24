require 'optparse'
require './lib/game'

options = {
    "strategy" => "basic",
    "deviations" => "20",
    "decks" => 6,
    "bet_spread" => "1-8",
    "insurance" => false,
    "surrender" => false,
    "hands" => 10000
}

OptionParser.new do |parser|

  parser.on("--strategy name", String) do |arg|
    options["strategy"] = arg
  end

  parser.on("--deviations name", String) do |arg|
    options["deviations"] = arg
  end
  
  parser.on("--decks name", Integer) do |arg|
    options["decks"] = arg
  end

  parser.on("--bet_spread name", String) do |arg|
    options["bet_spread"] = arg
  end

  parser.on("--hands name", Integer) do |arg|
    options["hands"] = arg
  end

  parser.on("--insurance") do |arg|
    options["insurance"] = arg
  end

  parser.on("--surrender") do |arg|
    options["surrender"] = arg
  end
end.parse!

game = Game.new(options)