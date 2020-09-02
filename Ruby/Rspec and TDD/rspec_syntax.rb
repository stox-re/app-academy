# hello_spec.rb

# Run to show test descriptions
# rspec -f d --color

require 'rspec'
require 'hello'

describe "#hello_world" do
  it "returns 'Hello, World!'" do
    expect(hello_world).to eq("Hello, World!")
  end
end

describe Integer do
  describe '#to_s' do
    it 'returns string representations of integers' do
      expect(5.to_s).to eq('5')
    end
  end
end

describe '#sqrt' do
  it 'throws an error if given a negative number' do
    expect { sqrt(-3) }.to raise_error(ArgumentError)
  end
end

describe Chess do
  let(:board) { Board.new }

  describe '#checkmate?' do
    context 'when in checkmate' do
      before(:each) do
        board.make_move([3, 4], [2, 3])
        board.make_move([1, 2], [4, 5])
        board.make_move([5, 3], [5, 1])
        board.make_move([6, 3], [2, 4])
      end

      it 'should return true' do
        expect(board.checkmate?(:black)).to be true
      end
    end
  end
end

describe '#valid_move?' do
  it 'should return false for wrong colored pieces'
  it 'should return false for moves that are off the board'
  it 'should return false for moves that put you in check'
end

describe Robot do
  subject(:robot) { Robot.new }
  let(:light_item) { double("light_item", :weight => 1) }
  let(:max_weight_item) { double("max_weight_item", :weight => 250) }

  describe "#pick_up" do
    it "does not add item past maximum weight of 250" do
      robot.pick_up(max_weight_item)

      expect do
        robot.pick_up(light_item)
      end.to raise_error(ArgumentError)
    end
  end
end