# Clone code from Services::Reservations::Calculator
require './app/services/reservations/calculator'


puts "You've passed the following arguments:"
ARGV.each do |arg|
  puts arg
  output = Reservations::Calculator.new(number_of_guests: arg).display_results
  puts "The Output is: #{output}"
end
