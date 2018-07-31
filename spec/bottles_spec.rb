RSpec.describe Bottles do
  describe "#verse" do
    context "given the first verse, 99" do
      it "should return the first verse" do
        expected = <<~VERSE
          99 bottles of beer on the wall,
          99 bottles of beer.
          Take one down and pass it around,
          98 bottles of beer on the wall.
        VERSE
        expect(Bottles.new.verse(99)).to eq expected
      end
    end

    context "given verse 3" do
      it "should return the verse ending with 2 bottles on the wall" do
        expected = <<~VERSE
          3 bottles of beer on the wall,
          3 bottles of beer.
          Take one down and pass it around,
          2 bottles of beer on the wall.
        VERSE
        expect(Bottles.new.verse(3)).to eq expected
      end
    end

    context "given verse 2" do
      it "should return the verse ending with 1 bottle of beer" do
        expected = <<~VERSE
          2 bottles of beer on the wall,
          2 bottles of beer.
          Take one down and pass it around,
          1 bottle of beer on the wall.
        VERSE
        expect(Bottles.new.verse(2)).to eq expected
      end
    end

    context "given verse 1" do
      it "should return the no more bottles verse" do
        expected = <<~VERSE
          1 bottle of beer on the wall,
          1 bottle of beer.
          Take it down and pass it around,
          no more bottles of beer on the wall.
        VERSE
        expect(Bottles.new.verse(1)).to eq expected
      end
    end

    context "given verse 0" do
      it "should tell you to go to the store" do
        expected = <<~VERSE
          No more bottles of beer on the wall,
          no more bottles of beer.
          Go to the store and buy some more,
          99 bottles of beer on the wall.
        VERSE
        expect(Bottles.new.verse(0)).to eq expected
      end
    end
  end

  describe "#verses" do
    context "given verses 99 and 98" do
      it "should return two verses" do
        expected = <<~VERSES
          99 bottles of beer on the wall,
          99 bottles of beer.
          Take one down and pass it around,
          98 bottles of beer on the wall.

          98 bottles of beer on the wall,
          98 bottles of beer.
          Take one down and pass it around,
          97 bottles of beer on the wall.
        VERSES
        expect(Bottles.new.verses(99, 98)).to eq expected
      end
    end

    context "given verses 2 through 0" do
      it "should return the last 3 verses" do
        expected = <<~VERSES
          2 bottles of beer on the wall,
          2 bottles of beer.
          Take one down and pass it around,
          1 bottle of beer on the wall.

          1 bottle of beer on the wall,
          1 bottle of beer.
          Take it down and pass it around,
          no more bottles of beer on the wall.

          No more bottles of beer on the wall,
          no more bottles of beer.
          Go to the store and buy some more,
          99 bottles of beer on the wall.
        VERSES
        expect(Bottles.new.verses(2, 0)).to eq expected
      end
    end
  end

  describe "#song" do
    it "should return the entire song verse 99 to 0" do
      expected = TestHelper.full_song
      expect(Bottles.new.song).to eq expected
    end
  end
end
