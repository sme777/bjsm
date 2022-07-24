# Blackjack Card Couting Simulator

Choose game configuration with following flags:

`--strategy name` is the name of the strategy the player will play. Default is basic strategy.

`--deviations name` is the name of the deviations the player will play. Default is top 20.

`--decks size` is the number of decks in the shoe. Default is 6.

`--bet_spread name` is the name of the bet spread the play will play. Default is 1-8 bet spread.

`--hands size` is the number of hands the player will play in the simulation. Default is 100,000.

`--bankroll size` is the size of player's bank roll. Default is 10,000.

`--minimum_bet size` is the size of the minimum bet. Default is 10.

`--insurance` is an optional flag for enabling insurance.

`--surrender` is an optional flag for enabling surrender.

A classic game with basic strategy, top 20 deviations, deck size of 6, bet spread 1-8 played 100,000 hands with no insurance or surrender:

```
ruby main.rb
```

Computing bootstrap sampling yield expected gain of $XX,XXX with standard deviation of $X,XXX$.