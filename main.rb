require "bundler/inline"

gemfile do
  source "https://rubygems.org"
  gem "rspec"
end

class Bottles
  def song
    verses(99, 0)
  end

  def verses(starting, ending)
    starting.downto(ending).map { |n| verse(n) }.join("\n")
  end

  def verse(number)
    case number
    when 1
      <<~VERSE
        1 bottle of beer on the wall,
        1 bottle of beer.
        Take it down and pass it around,
        no more bottles of beer on the wall.
      VERSE
    when 0
      <<~VERSE
        No more bottles of beer on the wall,
        no more bottles of beer.
        Go to the store and buy some more,
        99 bottles of beer on the wall.
      VERSE
    else
      <<~VERSE
        #{number} bottles of beer on the wall,
        #{number} bottles of beer.
        Take one down and pass it around,
        #{number - 1} #{container(number - 1)} of beer on the wall.
      VERSE
    end
  end

  def container(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end
end
