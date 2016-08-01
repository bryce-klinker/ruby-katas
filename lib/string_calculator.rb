class StringCalculator
  def add(input)
    if input.empty?
      return 0
    end

    delimiter = getDelimiter(input)
    numbers = input.split(delimiter).map { |val| val.to_i }
    return numbers.inject(0) { |sum, number| sum + number }
  end

  def getNumbers(input)
    delimiter = hasCustomDelimiter(input) ? getDelimiter(input) : ','
    numberString = hasCustomDelimiter(input) ? stripDelimiter(input) : input
    return numberString.split(delimiter).map { |val| val.to_i }
  end

  def hasCustomDelimiter(input)
    return input.start_with?('//')
  end

  def getDelimiter(input)
    unless hasCustomDelimiter(input)
      return ','
    end

    inputWithoutDelimiterIndicator = input[2..-1]
    newLineIndex = inputWithoutDelimiterIndicator.index('\n')
    delimiter = inputWithoutDelimiterIndicator[0..newLineIndex - 1]
    return delimiter
  end
end