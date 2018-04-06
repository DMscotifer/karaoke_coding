require("pry")

require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")

class GuestTest < MiniTest::Test

  def setup()
    @guest1 = Guest.new("John Smith", nil, 50)
    @guest2 = Guest.new("Alice", nil, 45)
    @guest3 = Guest.new("Sarah", nil, 90)
    @guest4 = Guest.new("Aletta", nil, 200)
    @guest5 = Guest.new("Lisa", nil, 120)
    @guest_list = [@guest1, @guest2, @guest3]
    @room1 = Room.new("Deluxe Suite", [], @playlist2)
    @room2 = Room.new("Standard", [], @playlist1)
    @song1 = Song.new("Don't Stop Me Now!")
    @song2 = Song.new("Bohemian Rhapsody")
    @song3 = Song.new("Crazy Little Thing Called Love")
    @song4 = Song.new("Stand Alone")
    @song5 = Song.new("Running Blind")
    @song6 = Song.new("Serenity")
    @playlist1 = [@song1, @song2, @song3]
    @playlist2 = [@song4, @song5, @song6]
  end

def test_check_in()
  @guest1.check_in(@room2)
  assert_equal(@room2, @guest1.in_room)
end

def test_check_out()
  @guest4.in_room = @room1
  @guest4.check_out
  assert_nil(@guest4.in_room)
end

def test_has_wallet()
  assert_equal(200, @guest4.wallet)
end


end
