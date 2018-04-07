require("pry")

class Room
  attr_accessor :name, :occupants, :max_occ, :playlist, :price, :cashier
  def initialize(name, occupants, max_occ, playlist, price, cashier)
    @name = name
    @occupants = occupants
    @max_occ = max_occ
    @playlist = playlist
    @price = price
    @cashier = cashier
  end

  def occupants_list()
    for guest in @occupants
      p guest.name
    end
  end

  def add_guest_list(add_guests)
    if @occupants.count < @max_occ
    for guest in add_guests
      @occupants.push(guest)
    end
    end
  end

  def add_guest(guest)
    @occupants.push(guest) if @occupants.count < @max_occ
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def find_guest(guest)
    for occupant in @occupants
      if occupant.name == guest
        return occupant
      end
    return nil
    end
  end

  def remove_all_guests()
    @occupants = []
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def playing_favourite_song()
    for guest in @occupants
      result = @playlist.include?(guest.favourite_song)
      if result == true
        return "Whoo!..."
      end
    end
  end

end

  def update_occupancy(guest, room)
    room.add_guest(guest)
    guest.check_in(room)
  end
