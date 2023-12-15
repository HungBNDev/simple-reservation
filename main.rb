# Clone code from Services::Reservations::Calculator
require './app/services/reservations/calculator'


puts "You've passed the following arguments:"
ARGV.each do |arg|
  puts arg
  puts Reservations::Calculator.new.find_best_option(arg)
end
