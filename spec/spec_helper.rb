$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'snakes_and_ladders_game'

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end
