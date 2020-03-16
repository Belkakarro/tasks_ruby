puts"Ввведите значение а"
a = gets.chomp.to_i

puts"Ввведите значение b"
b = gets.chomp.to_i

puts"Ввведите значение c"
c = gets.chomp.to_i

discriminant = b**2 - 4 * a * c

if discriminant > 0
	x1 = (-b + discriminant**0.5) / 2.0 * a
	x2 = (-b - discriminant**0.5) / 2.0 * a
	puts"Дискриминант = #{discriminant}, корень х1 = #{x1}, корень х2 = #{x2}"
elsif discriminant == 0
	x = (-b - discriminant**0.5)/2.0 * a
	puts"Дискриминант = #{discriminant}, корень х = #{x}"
else
	puts"Дискриминант < 0, корней нет."
end