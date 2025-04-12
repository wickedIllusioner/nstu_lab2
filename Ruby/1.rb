def min_operation(s)
  n = s.length
  steps = []
  current = ""

  (n / 2).downto(1) do |i|
    if s[0...i] == s[i...2*i]
      (0...i).each do |j|
        current += s[j]
        steps << current.dup
      end
      current += current
      steps << current.dup
      current = ""
      (2*i...n).each do |j|
        current += s[j]
        steps << current.dup
      end
      return [i + 1 + (n - 2*i), steps]
    end
  end

  s.each_char do |c|
    current += c
    steps << current.dup
  end
  [n, steps]
end

input = gets.chomp
result = min_operation(input)

print "#{result[0]} = "
puts result[1].join("->")