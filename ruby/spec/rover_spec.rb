require 'rover'

describe Rover do

  describe 'when facing north' do
    before(:each) do 
      @rover = Rover.new('0 0 N')
    end

    it "should face west after turning left" do
        @rover.turn("L")
        @rover.orientation.should == 'W'
    end

    it "should face east after turning right" do
        @rover.turn("R")
        @rover.orientation.should == 'E'
    end
  end

  describe 'when facing south' do
    before(:each) do 
      @rover = Rover.new('0 0 S')
    end
  
    it "should face east after turning left" do
        @rover.turn("L")
        @rover.orientation.should == 'E'
    end
  end

  describe 'when facing east' do
    before(:each) do 
      @rover = Rover.new('0 0 E')
    end
  
    it "should face south after turning right" do
        @rover.move("R")
        @rover.orientation.should == 'S'
    end
  end

  describe 'moving by one' do
    before(:each) do
      @rover = Rover.new('2 2 N')
    end

    it "should move north" do
      @rover.move('M')
      @rover.x.should == 3
    end
  end

  describe 'moving with multiple instructions' do
    before(:each) do
      @rover = Rover.new('1 2 N')
    end

    it "should move north" do
      @rover.movement_instructions('MLLM')
      @rover.to_s.should == [1, 2, "S"]
    end
  end
end