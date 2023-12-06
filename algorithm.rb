DATA = [
  room_types: [:single, :double, :family],
  sleeps: {
    single: 1,
    double: 2,
    family: 4
  },
  available_rooms: {
    single: 2,
    double: 3,
    family: 1
  },
  price: {
    single: 30,
    double: 50,
    family: 85
  }
]

def calculate_price(number_of_guests)
  results = {
    allocated: {
      family: 0,
      double: 0,
      single: 0
    },
    no_option: false
  }

  while (number_of_guests > 0) do
    maximum_sleep_key = DATA[:sleeps].key(DATA[:sleeps].values.max)

    if (number_of_guests > DATA[:sleeps][maximum_sleep_key])
      if DATA[:available_rooms][maximum_sleep_key].zero?
        results[:no_option] = true
        return
      end

      number_of_guests                          = number_of_guests - maximum_sleep_key # rubocop:disable Lint/Syntax, Lint/Syntax
      results[:allocated][maximum_sleep_key]    = results[:allocated][maximum_sleep_key] + 1

      DATA[:available_rooms][maximum_sleep_key] = DATA[:available_rooms][maximum_sleep_key] - 1

      if DATA[:available_rooms][maximum_sleep_key].zero?
        DATA[:sleeps].except!(maximum_sleep_key)
      end
    else
      results[:no_option] = true
    end
  end
end
