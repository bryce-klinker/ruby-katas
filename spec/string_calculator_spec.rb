require 'string_calculator'

describe StringCalculator do
  describe('.add') do
    before(:each) do
      @calculator = StringCalculator.new
    end

    context('given an empty string') do
      it('returns zero') do
        expect(@calculator.add('')).to eql(0)
      end
    end

    context('given a number') do
      it('returns number') do
        expect(@calculator.add('5')).to eql(5)
      end
    end

    context('given two numbers') do
      it('returns sum of two numbers') do
        expect(@calculator.add('6,3')).to eql(9)
      end
    end

    context('given three numbers') do
      it('returns sum of three numbers') do
        expect(@calculator.add('5,1,4')).to eql(10)
      end
    end

    context('given custom delimiter') do
      context('single character custom delmiter') do
        it('returns sum of two numbers') do
          expect(@calculator.add('//|\n75|12|32')).to eql(119)
        end
      end
    end
  end
end