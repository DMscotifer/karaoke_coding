require("pry")

require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../bar.rb")
require_relative("../drinks.rb")

class SongsTest < MiniTest::Test

def setup()
  @song1 = Song.new("Don't Stop Me Now!")
end

def test_song_has_name()
  assert_equal("Don't Stop Me Now!", @song1.name)
end

end
