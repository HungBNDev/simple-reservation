module Reservations
  class Calculator
    attr_reader :number_of_guests,
                :results,
                :reservation_master_data

    def initialize(number_of_guests:)
      @reservation_master_data = {
        sleeps: {
          single: 1,
          double: 2,
          family: 4,
        },
        available_rooms: {
          single: 2,
          double: 3,
          family: 1,
        },
        price: {
          single: 30,
          double: 50,
          family: 85,
        },
      }
      @number_of_guests = number_of_guests.to_i
      @results          = {
        allocated: {
          family: 0,
          double: 0,
          single: 0
        },
        price: 0,
        no_option: false
      }
    end

    def call
      @results[:no_option] = true if @number_of_guests <= 0

      while (@number_of_guests > 0) do
        maximum_sleep_key = sleep_data.key(sleep_data.values.max)
        maximum_sleep_val = sleep_data[maximum_sleep_key]

        break if satified condition: maximum_sleep_val.nil?

        if (@number_of_guests >= maximum_sleep_val)
          break if satified condition: available_rooms[maximum_sleep_key].zero?

          calculate_data(
            maximum_sleep_key: maximum_sleep_key,
            maximum_sleep_val: maximum_sleep_val
          )

          reduce_data(maximum_sleep_key: maximum_sleep_key) if available_rooms[maximum_sleep_key].zero?
        else
          reduce_data(maximum_sleep_key: maximum_sleep_key)
        end
      end

      @results
    end

    def display_results
      call
      return "There is no option" if results[:no_option] == true

      str_room_result = []
      results[:allocated].each do |key, value|
        next if value.to_i.zero?

        str_room_result << "#{value} * #{key.to_s.capitalize}"
      end

      str_room_result.join(" + ") + " = " + "Total: $#{results[:price]}"
    end

    private

    def satified(condition:)
      @results[:no_option] = true if condition
      condition
    end

    def reduce_data(maximum_sleep_key:)
      sleep_data.delete(maximum_sleep_key)
    end

    def calculate_data(maximum_sleep_key:, maximum_sleep_val:)
      price_data                                = reservation_master_data[:price]
      @number_of_guests                         = @number_of_guests - maximum_sleep_val
      @results[:allocated][maximum_sleep_key]   = @results[:allocated][maximum_sleep_key] + 1
      @results[:price]                          = @results[:price] + price_data[maximum_sleep_key]
      available_rooms[maximum_sleep_key]        = available_rooms[maximum_sleep_key] - 1
    end

    def available_rooms
     @available_rooms ||= reservation_master_data[:available_rooms]
    end

    def sleep_data
      @sleep_data ||= reservation_master_data[:sleeps].to_h
    end
  end
end
