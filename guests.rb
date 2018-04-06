require("pry")

class Guest
  attr_accessor :name, :in_room, :wallet
  def initialize(name, in_room, wallet)
    @name = name
    @in_room = in_room
    @wallet = wallet
  end

def check_in(in_room)
  @in_room = in_room
end

def check_out()
  @in_room = nil
end


end
