puts "Введите основание треугольника:"
a = gets.chomp.to_i

puts "Введите высоту треугольника:"
h = gets.chomp.to_i

square = 1 / 2.0 * a * h

puts "Общая площадь треугольника #{square} ед. кв"
