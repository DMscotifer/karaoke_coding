require("pry")

require("minitest/autorun")
require("minitest/rg")

require_relative("../guests.rb")
require_relative("../rooms.rb")
require_relative("../songs.rb")
require_relative("../bar.rb")
require_relative("../drinks.rb")

class BarTest < MiniTest::Test

def setup()
    @drink1 = Drink.new("Duff", 3, 3)
    @drink2 = Drink.new("Corona", 4, 2)
    @drink3 = Drink.new("Tennents", 3, 2)
    @drinks_menu = [@drink1, @drink2, @drink3]
    @room1 = Room.new("Deluxe Suite", [], 5, @playlist, 20, 0, 0)
    @room2 = Room.new("Standard", [], 4, @playlist, 10, 0, 0)
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
    @bar1 = Bar.new("House Bar", @drinks_menu)
end

def test_bar_has_drinks()
    assert_equal(3, @bar1.drinks.count)
end

def test_find_drink_by_name()
  @bar1.find_drink_by_name("Corona")
  assert_equal(true, @bar1.drinks.include?(@drink2))
end


def test_guest_buys_drink__()
  @room1.tab = 100
  @bar1.buys_drink(@guest1, @room1, "Corona")
  assert_equal(50, @guest1.wallet)
  assert_equal(96, @room1.tab)
end

def test_set_bar_tab()
  assert_equal(200, @room1.set_bar_tab(200))
end

end
