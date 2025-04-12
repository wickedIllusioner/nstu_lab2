def count_even(num)
  counter = 0
  while num > 0
    n = num % 10
    if n % 2 == 0
        counter += 1
    end
    num /= 10
  end
  counter
end

n = gets.chomp.to_i
n.times do
    tmp = gets.chomp.to_i
    puts count_even(tmp)
end