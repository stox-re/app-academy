require 'towers'

describe Towers do
  subject(:towers) { Towers.new(3) }

  describe '#initialize' do
    it 'initializes 3 arrays, where the first array has 3 discs of size: 1,2,3' do
      expect(towers.disc0).to eq([3, 2, 1])
      expect(towers.disc1).to be_empty
      expect(towers.disc2).to be_empty
    end
  end

  describe '#move' do
    it 'takes the top piece of a disc and moves it to a new disc' do
      towers.move(0, 1)
      expect(towers.disc1).to eq([1])
      towers.move(0, 2)
      expect(towers.disc2).to eq([2])
      towers.move(1, 2)
      expect(towers.disc2).to eq([2, 1])
      towers.move(0, 1)
      expect(towers.disc1).to eq([3])
      #towers.move(1, 2) # If I run it here, the program crashes with the RuntimeError
    end

    it 'raises an error if a larger disc is moved ontop of a smaller disc' do
      towers.move(0, 1)
      towers.move(0, 2)
      towers.move(1, 2)
      towers.move(0, 1)
      expect{ towers.move(1, 2) }.to raise_error("This disc is larger then the rod you want to put it on.")
      # If I run it from here with bundle exec rspec, it tells me 'nothing was raised'.
    end
  end

  describe '#won' do
    it 'has all the discs in proper order on the last rod' do
      towers.move(0, 1)
      towers.move(0, 2)
      towers.move(1, 2)
      towers.move(0, 1)
      towers.move(2, 1)
      towers.move(2, 0)
      towers.move(1, 0)
      towers.move(1, 2)
      towers.move(0, 1)
      towers.move(0, 2)
      towers.move(1, 2)
      expect(towers.disc2).to eq([3, 2, 1])
    end
  end
end