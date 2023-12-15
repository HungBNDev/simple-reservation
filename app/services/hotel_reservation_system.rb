class HotelReservationSystem
  Room = Struct.new(:type, :sleeps, :available, :price)

  def initialize
    @rooms = [
      Room.new('Single', 1, 2, 30),
      Room.new('Double', 2, 3, 50),
      Room.new('Family', 4, 1, 85)
    ]
  end

  def find_best_option(guests)
    best_option = find_combination(guests)
    return 'No option' if best_option.nil?

    format_output(best_option)
  end

  private

  def find_combination(guests, index = 0, current_combination = [], best_combination = nil)
    return best_combination if guests < 0
    return current_combination.dup if guests == 0

    while index < @rooms.length
      room = @rooms[index]
      if room.available > 0
        room.available -= 1
        current_combination.push(room.type)
        best_combination = find_combination(guests - room.sleeps, index, current_combination, best_combination)
        current_combination.pop
        room.available += 1
      end
      index += 1
    end

    best_combination
  end

  def format_output(combination)
    price = combination.sum { |type| @rooms.find { |room| room.type == type }.price }
    "#{combination.join(' ')} - $#{price}"
  end
end
