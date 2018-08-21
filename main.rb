require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec"
end

require_relative "bottle_number"

class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map { |n| verse(n) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.new(number)
    next_bottle_number = BottleNumber.new(bottle_number.successor)

    <<~VERSE
      #{bottle_number.quantity.capitalize} #{bottle_number.container} of beer on the wall,
      #{bottle_number.quantity} #{bottle_number.container} of beer.
      #{bottle_number.action},
      #{next_bottle_number.quantity} #{next_bottle_number.container} of beer on the wall.
    VERSE
  end
end
