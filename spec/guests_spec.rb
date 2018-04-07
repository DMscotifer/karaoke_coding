require("pry")

require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")

class GuestTest < MiniTest::Test

  def setup()
    @room1 = Room.new("Deluxe Suite", [], 5, @playlist, 20, 0)
    @room2 = Room.new("Standard", [], 4, @playlist, 10, 0)
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

def test_move_to()
  @guest1.check_in(@room1)
  @guest1.move_to(@room2)
  assert_equal(@room2, @guest1.in_room)
end

def test_pay_entry___can_afford_entry()
  assert_equal(true, @guest1.can_afford(@room1))
end

def test_pay_entry___pay_fee()
  assert_equal(20, @guest1.pay_entry(@room1))
end

def test_has_favourite_song()
  assert_equal(@song1, @guest1.favourite_song)
end

def test_pay_entry___pay_cashier()
  @guest1.pay_entry(@room1)
  assert_equal(20, @room1.cashier)
end

end
