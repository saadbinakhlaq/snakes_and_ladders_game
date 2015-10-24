# SnakesAndLaddersGame
## Installation

clone this repo

then run

    $ gem build snakes_and_ladders_game.gemspec

And then execute:

    $ gem install snakes_and_ladders_game-0.1.0.gem

Then go to irb or pry console
    $ pry
## Usage

```ruby
require 'snakes_and_ladders_game'

player1 = Player.new 'player1'
player2 = Player.new 'player2'
game = Game.new [player1, player2]
game.play_turn
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/saadbinakhlaq/snakes_and_ladders_game.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

