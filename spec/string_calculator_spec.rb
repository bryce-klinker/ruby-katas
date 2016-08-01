require 'string_calculator'

describe StringCalculator do
  describe('add') do
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
      context('single character custom delimiter') do
        it('returns sum of numbers') do
          expect(@calculator.add('//|\n75|12|32')).to eql(119)
        end
      end

      context('multiple character custom delimiter') do
        it('returns sum of numbers') do
          expect(@calculator.add('//[&&]\n54&&54')).to eql(108)
        end
      end
    end

    context('given negative numbers') do
      it('should throw no negatives allowed') do
        expect{ @calculator.add('-3') }.to raise_error(ArgumentError, 'No Negatives allowed')
      end
    end

    context('given number(s) greater than 1000') do
      it('should ignore 1000') do
        expect(@calculator.add('1000,45')).to eql(45)
      end
    end

    context('given multiple delimiters') do
      context('single character custom delimiter') do
        it('should add numbers') do
          expect(@calculator.add('//[*][%]\n12*5%4')).to eql(21)
        end
      end

      context('multiple character custom delimiter') do
        it('should add numbers') do
          expect(@calculator.add('//[***][..]\n12***5..4')).to eql(21)
        end
      end

    end
  end
end