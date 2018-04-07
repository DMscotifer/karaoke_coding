require("pry")

class Guest
  attr_accessor :name, :in_room, :wallet, :favourite_song
  def initialize(name, in_room, wallet, favourite_song)
    @name = name
    @in_room = in_room
    @wallet = wallet
    @favourite_song = favourite_song
  end

def check_in(in_room)
  @in_room = in_room
end

def check_out()
  @in_room = nil
end

def move_to(room)
  @in_room = room if room.occupants.count < room.max_occ
end

def can_afford(room)
  return true if @wallet >= room.price
end

def pay_entry(room)
  if can_afford(room) == true
    @wallet -= room.price
    room.cashier += room.price
  end
end

end
