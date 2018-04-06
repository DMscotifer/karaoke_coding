require("pry")

require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")

class RoomsTest < MiniTest::Test

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

def test_room_has_name()
  assert_equal("Deluxe Suite", @room1.name)
end

def test_room_has_occupants()
  assert_equal(0, @room1.occupants.count)
end

def test_occupant_list()
  assert_equal([], @room1.occupants_list)
end

def test_add_guest_list()
  guests = @guest_list
  @room1.add_guest_list(guests)
  assert_equal(3, @room1.occupants.count)
end

def test_add_guest()
  @room1.add_guest(@guest5)
  assert_equal(true, @room1.occupants_list.include?(@guest5))
end

def test_remove_guest()
  @room1.remove_guest(@guest4)
  assert_equal(false, @room1.occupants_list.include?(@guest4))
end

def test_add_song_to_playlist___empty()
  assert_equal(0, @room1.playlist.count)
end

def test_add_song_to_playlist___add()
  @room1.add_song_to_playlist(@song6)
  assert_equal(1, @room1.playlist.count)
  assert_equal(true, @room1.playlist.include?(@song6))
end


# def test_room_is_already_occupied()
#     @room1.occupants = ["Marina", "Rachel", "Ashley"]
#     assert_equal(["Marina", "Rachel", "Ashley"], @room1.occupants)
# end
#
# def test_room_remove_occupants__person_leaves()
#   @room1.occupants = ["Marina", "Rachel", "Ashley"]
#   @room1.occupants.pop()
#   assert_equal(2, @room1.occupants.count)
# end


end
