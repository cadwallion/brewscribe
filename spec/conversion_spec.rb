require 'spec_helper'

describe Brewscribe::Conversion do
  describe 'PERCENT_CONV' do
    it 'returns a lambda' do
      Brewscribe::Conversion::PERCENT_CONV.should respond_to :call
    end

    it 'converts to a Float and shifts by 0.01' do
      Brewscribe::Conversion::PERCENT_CONV.call('1.01').should == 0.00101
    end
  end

  describe 'FLOAT_CONV' do
    it 'returns a lambda' do
      Brewscribe::Conversion::FLOAT_CONV.should respond_to :call
    end

    it 'converts to a Float' do
      Brewscribe::Conversion::FLOAT_CONV.call('15.044').should == 15.044
    end
  end

  describe 'BOOLEAN_CONV' do
    it 'returns a lambda' do
      Brewscribe::Conversion::BOOLEAN_CONV.should respond_to :call
    end

    it 'converts 1 to true' do
      Brewscribe::Conversion::BOOLEAN_CONV.call('1').should be_true
    end

    it 'converts 0 to false' do
      Brewscribe::Conversion::BOOLEAN_CONV.call('0').should be_false
    end
  end
end
