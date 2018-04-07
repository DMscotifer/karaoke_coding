require("pry")

class Bar
attr_accessor :name, :drinks
def initialize(name, drinks)
  @name = name
  @drinks = drinks
end

def find_drink_by_name(drink_name)
  for drink in @drinks
    if drink == drink_name
      return drink
    end
  return nil
  end
end


def get_drink_price(drink_name)
  for drink in drinks
    if drink.name == drink_name
      return drink.price
    end
  end
end

def buys_drink(guest, room, drink_name)
  if room.tab > get_drink_price(drink_name)
    room.tab -= get_drink_price(drink_name)
  else
    guest.wallet -= get_drink_price(drink_name)
  end
end


end
