class StringCalculator
  def add(input)
    if input.empty?
      return 0
    end

    numbers = getNumbers(input)
    if numbers.any? { |number| number < 0}
      raise ArgumentError, 'No Negatives allowed', caller
    end

    return numbers.inject(0) { |sum, number| sum + number }
  end

  def getNumbers(input)
    delimiter = hasCustomDelimiter(input) ? getDelimiter(input) : ','
    numberString = hasCustomDelimiter(input) ? stripDelimiter(input) : input
    return numberString.split(delimiter).map { |val| val.to_i }
  end

  def stripDelimiter(input)
    endOfDelimiterIndex = input.index('\n')
    return input[endOfDelimiterIndex + 2..-1]
  end

  def hasCustomDelimiter(input)
    return input.start_with?('//')
  end

  def getDelimiter(input)
    unless hasCustomDelimiter(input)
      return ','
    end

    if isSingleCharacterDelimiter(input)
      return getSingleCharacterDelimiter(input)
    end

    return getMultipleCharacterDelimiter(input)
  end

  def isSingleCharacterDelimiter(input)
    return hasCustomDelimiter(input) & !input.start_with?('//[')
  end

  def getSingleCharacterDelimiter(input)
    inputWithoutDelimiterIndicator = stripCustomDelimiterStart(input)
    endOfDelimiterIndex = getEndOfDelimiterIndex(inputWithoutDelimiterIndicator)

    return inputWithoutDelimiterIndicator[0..endOfDelimiterIndex - 1]
  end

  def getMultipleCharacterDelimiter(input)
    inputWithoutDelimiterIndicator = stripCustomDelimiterStart(input)
    endOfDelimiterIndex = getEndOfDelimiterIndex(inputWithoutDelimiterIndicator)
    return inputWithoutDelimiterIndicator[1..endOfDelimiterIndex - 2]
  end

  def stripCustomDelimiterStart(input)
    return input[2..-1]
  end

  def getEndOfDelimiterIndex(inputWithoutDelimiterStart)
    return inputWithoutDelimiterStart.index('\n')
  end
end