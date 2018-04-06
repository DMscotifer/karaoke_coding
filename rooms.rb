require("pry")

class Room
  attr_accessor :name, :occupants, :playlist
  def initialize(name, occupants, playlist)
    @name = name
    @occupants = occupants
    @playlist = []
  end

  def occupants_list()
    for guest in @occupants
      p guest.name
    end
  end

  def add_guest_list(add_guests)
    for guest in add_guests
      @occupants.push(guest)
    end
  end

  def add_guest(guest)
    @occupants.push(guest)
  end

  def remove_guest(guest)
    @occupants.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end


end
