require 'rails_helper'

RSpec.describe HotelReservationSystem, type: :service do
  describe "#find_best_option" do
    it "should return the satified rooms and price against the guests" do
      expect(HotelReservationSystem.new.find_best_option(-5)).to eq "No option"
      expect(HotelReservationSystem.new.find_best_option(0)).to eq " - $0"
      expect(HotelReservationSystem.new.find_best_option(1)).to eq "Single - $30"
      expect(HotelReservationSystem.new.find_best_option(2)).to eq "Double - $50"
      expect(HotelReservationSystem.new.find_best_option(3)).to eq "Single Double - $80"
      expect(HotelReservationSystem.new.find_best_option(4)).to eq "Family - $85"
      expect(HotelReservationSystem.new.find_best_option(5)).to eq "Single Family - $115"
      expect(HotelReservationSystem.new.find_best_option(6)).to eq "Double Family - $135"
      expect(HotelReservationSystem.new.find_best_option(7)).to eq "Single Double Family - $165"
      expect(HotelReservationSystem.new.find_best_option(8)).to eq "Double Double Family - $185"
      expect(HotelReservationSystem.new.find_best_option(9)).to eq "Single Double Double Family - $215"
      expect(HotelReservationSystem.new.find_best_option(10)).to eq "Double Double Double Family - $235"
      expect(HotelReservationSystem.new.find_best_option(11)).to eq "Single Double Double Double Family - $265"
      expect(HotelReservationSystem.new.find_best_option(12)).to eq "Single Single Double Double Double Family - $295"
      expect(HotelReservationSystem.new.find_best_option(13)).to eq "No option"
      expect(HotelReservationSystem.new.find_best_option(17)).to eq "No option"
    end
  end
end
