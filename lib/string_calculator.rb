class StringCalculator
  def add(input)
    if input.empty?
      return 0
    end

    numbers = getNumbers(input)
      .select { |number| number < 1000 }

    if numbers.any? { |number| number < 0}
      raise ArgumentError, 'No Negatives allowed', caller
    end

    return numbers.inject(0) { |sum, number| sum + number }
  end

  def getNumbers(input)
    normalizedInput = normalizeDelimiters(input)
    return normalizedInput.split(',').map { |val| val.to_i }
  end

  def normalizeDelimiters(input)
    splitInput = input.split('\n')
    if splitInput.count <= 1
      return input
    end

    normalized = splitInput[1]
    delimiters = getDelimiters(splitInput[0])
    delimiters.each do |delimiter|
      normalized = normalized.gsub(delimiter, ',')
    end

    return normalized
  end
  
  def getDelimiters(inputDelimiter)
    delimiters = inputDelimiter[2..-1]
    if delimiters.length == 1
      return [delimiters]
    end

    return parseDelimiters(delimiters)
  end

  def parseDelimiters(inputDelimiter)
    return inputDelimiter
      .split('[')
      .select { |part| part.length > 1 }
      .map { |part| part.gsub(']', '') }
  end
end