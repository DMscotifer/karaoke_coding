require("pry")

require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../bar.rb")
require_relative("../drinks.rb")

class RoomTest < MiniTest::Test


def setup()
  @drink1 = Drink.new("Duff", 3, 3)
  @drink2 = Drink.new("Corona", 4, 2)
  @drink3 = Drink.new("Tennents", 3, 2)
  @drinks_menu = [@drink1, @drink2, @drink3]
  @room1 = Room.new("Deluxe Suite", [], 5, @playlist, 20, 0, 100)
  @room2 = Room.new("Standard", [], 4, @playlist, 10, 0, 100)
  @song1 = Song.new("Don't Stop Me Now!")
  @song2 = Song.new("Bohemian Rhapsody")
  @song3 = Song.new("Crazy Little Thing Called Love")
  @song4 = Song.new("Stand Alone")
  @song5 = Song.new("Running Blind")
  @song6 = Song.new("Serenity")
  @guest1 = Guest.new("Charlize", nil, 50, @song1)
  @guest2 = Guest.new("Alice", nil, 45, @song2)
  @guest3 = Guest.new("Sarah", nil, 90, @song6)
  @guest4 = Guest.new("Aletta", nil, 200, @song2)
  @guest5 = Guest.new("Lisa", nil, 120, @song3)
  @playlist = [@song1, @song2, @song3]
  @guest_list = [@guest1, @guest2, @guest3]
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
  @room1.playlist = []
  assert_equal(0, @room1.playlist.count)
end

def test_add_song_to_playlist___add()
  @room1.playlist = []
  @room1.add_song_to_playlist(@song6)
  assert_equal(1, @room1.playlist.count())
  assert_equal(true, @room1.playlist.include?(@song6))
end

def test_move_guests()
  @guest1.check_in(@room2)
  @guest1.move_to(@room1)
  assert_equal(@room1, @guest1.in_room)
end

def test_move_guest___update_occupants()
  @guest1.check_in(@room2)
  @room2.add_guest(@guest1)
  assert_equal(@room2, @guest1.in_room)
  assert_equal(1, @room2.occupants.count)
end

def test_update_occupancy()
  update_occupancy(@guest1, @room2)
  assert_equal(@room2, @guest1.in_room)
  assert_equal(1, @room2.occupants.count)
end

def test_find_guest()
  update_occupancy(@guest4, @room1)
  assert_equal(@guest4, @room1.find_guest("Aletta"))
end

def test_checking_occupancy___restrict()
  @room1.occupants = [@guest1, @guest2, @guest3, @guest4, @guest5]
  @room1.add_guest(@guest6)
  assert_equal(5, @room1.occupants.count)
end

def test_check_favourite_song()
  assert_equal(true, @guest1.favourite_song == @song1)
end

def test_check_favourite_song()
  @room1.playlist = [@song1, @song2, @song3]
  assert_equal(true, @guest1.favourite_song == @room1.playlist[0])
end


def test_playing_favourite_song()
  @room1.occupants = [@guest1]
  @room1.playlist = [@song1, @song2, @song3]
  assert_equal("Whoo!...", @room1.playing_favourite_song)
end

end
