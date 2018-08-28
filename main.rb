require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec"
end

require_relative "bottle_number"
require_relative "bottle_number0"
require_relative "bottle_number1"
require_relative "bottle_number6"

class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map { |n| verse(n) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall,\n".capitalize +
    "#{bottle_number} of beer.\n" +
    "#{bottle_number.action},\n" +
    "#{bottle_number.successor} of beer on the wall.\n"
  end
end
