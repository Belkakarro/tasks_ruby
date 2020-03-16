puts "Первая сторона треугольника"
a = gets.chomp.to_i

puts "Вторая сторона треугольника"
b = gets.chomp.to_i

puts "Третья сторона треугольника"
c = gets.chomp.to_i

if a == b && b == c && a ==c
	puts"Треугольник равносторонний"
elsif a > b && a > c
	hypotenuse = a
	leg1 = b
	leg2 = c
elsif b > c && b > a
	hypotenuse = b
	leg1 = a
	leg2 = c
elsif c > a && c > b
	hypotenuse = c
	leg1 = a
	leg2 = b
end

if hypotenuse**2 == leg1**2 + leg2**2
	puts "Треугольник прямоугольный"
else
	puts "Треугольник не прямоугольный"
end

if a == b || b == c || a == c
	puts"Треугольник равнобедренный" 
end