class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..-1]
    else
      delimiter = ','
    end

    negatives = numbers.split(/[\n#{delimiter}]/).map(&:to_i).select { |n| n < 0 }

    if negatives.any?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    numbers.split(/[\n#{delimiter}]/).map(&:to_i).sum
  end
end